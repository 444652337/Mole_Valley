class Admin::SessionsController < Admin::ApplicationController

  skip_before_filter :check_admin

  def new
    redirect_to admin_path if is_admin?
  end

  def create
    if Setting.admin? params[:username], params[:password]
      session[:admin] = true
      redirect_to admin_events_path
    else
      flash[:error] = 'wrong username or password！'
      redirect_to :action => 'new'
    end
  end

  def destroy
    session[:admin] = nil
    redirect_to :action => :new
  end
end
