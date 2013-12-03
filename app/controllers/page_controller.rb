class PageController < ApplicationController
  # home page
  def index
  end

  def sites
  end

  def resources
  end

  def audit
  end

  def contact
  end

  def events
    @events = Event.order("id desc").all
  end

  def organisations
    @organisations = Organisation.order("id desc").all
  end
end
