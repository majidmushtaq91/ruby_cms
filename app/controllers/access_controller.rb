class AccessController < ApplicationController
  layout('admin')

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
            #TODO mark user as logged !
            flash[:notice] = "You are logged in as " + params[:username]
            redirect_to(:action => "index")
          else
            flash[:notice] = "Invalid username and password !"
            redirect_to(:action => "login")
          end
        else
        flash[:notice] = "Invalid username and password !"
        redirect_to(:action => "login")
        end
     else
     flash[:notice] = "Empty field"
     redirect_to(:action => "login")
     end
  end

  def logout

  end
end
