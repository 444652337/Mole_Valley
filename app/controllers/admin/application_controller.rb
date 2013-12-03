class Admin::ApplicationController < ApplicationController
  before_filter :check_admin

  helper_method :is_admin?

  layout 'admin_layout'

  protected
  # check for whether admin has logged in
  def check_admin
    redirect_to new_admin_session_path unless is_admin?
  end

  def is_admin?
    return session[:admin] == true
  end
end
