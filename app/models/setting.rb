require 'active_support'
class Setting < ActiveRecord::Base
  validates :key, :value, :presence => true

  # set admin password
  def self.admin_password=(password)
    self[:admin_pass_salt] = SecureRandom.hex(10)
    self[:admin_password] = Digest::SHA1.hexdigest(self.admin_pass_salt + password)
  end

  # validate inputed password
  def self.admin?(username, password)
    return ((self.admin_username == username) && (Digest::SHA1.hexdigest(self.admin_pass_salt + password) == self.admin_password))
  end

  # define method for convenient usage
  def self.method_missing(method, *args)
    method_name = method.to_s
    super(method, *args)
  rescue NoMethodError
    #setter
    if method_name =~ /=$/
      key = method_name.gsub('=', '')
      value = args.first
      self[key] = value
      #getter
    else
      return self[method_name]
    end
  end

  # get value for specific key
  def self.[](key)
    return self.where(:key=>key).first.try(:value)
  end

  # set value for specific key
  def self.[]=(key, value)
    setting = self.where(:key=>key).first
    if setting.nil?
      Setting.create(:key=>key, :value=>value)
    else
      setting.update_attribute(:value, value)
    end
  end
end
