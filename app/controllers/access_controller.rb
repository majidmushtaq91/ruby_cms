class AccessController < ApplicationController
  layout('admin')
  before_action :confirm_logged_in, :except  => [:login, :attempt_login, :logout]
  def index
  end

  def login
  end

  def attempt_login
     if params[:username].present? && params[:password].present?
        found_user = AdminUser.where(:username => params[:username]).first
        if found_user
          authorized_user = found_user.authenticate(params[:password])
          if authorized_user
            #mark user as logged !
            session[:user_id] = authorized_user.id
            session[:username] = authorized_user.username
            flash[:notice] = "You are logged in as " + params[:username]
            redirect_to(:controller => "page", :action => "index")
          else
            flash[:notice] = "Invalid username and password !"
            redirect_to(:action => "login")
          end
        else
        flash[:notice] = "Invalid username and password !"
        redirect_to(:action => "login")
        end
     else
     flash[:notice] = "Invalid username and password !"
     redirect_to(:action => "login")
     end
  end

  def logout
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "Logged out !"
    redirect_to(:action => "login")

  end


end
