class UsersController < ApplicationController

  layout("admin")

  before_action :confirm_logged_in

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      flash[:notice] = "User created"
      redirect_to(:action => "list")
    else
      flash[:notice] = "Error while creating new user !"
      render("new")
    end

  end

  def edit
  end

  def delete
    @user = User.find(params[:id])
  end

  def destroy
    User.destroy(params[:id])
    flash[:notice] = "User has been remove !"
    redirect_to(:action => 'list')
  end

  def list
    @users = User.all
  end

  def index
    @users = User.all
    render("list")
  end

  def update_status
    @user = User.find(params[:id])
    if params[:status] == 'true'

      @user.update_attributes(:status => '1')
    end
    if params[:status] == 'false'
      @user.update_attributes(:status => '0')
    end

    flash[:notice] = 'User Updated successfully'
    redirect_to(:action => 'index', :id => @user.id)
  end

  private

  def users_params
    params.require(:users).permit(:first_name, :last_name, :username, :email, :status, :password)
  end
end
