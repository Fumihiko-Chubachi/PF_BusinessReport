class Admin::UsersController < ApplicationController

  def new
    @user = User.new(params[:id])
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to admin_departments_path
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:department_id, :name, :employee_code, :position, :email, :password)
  end

end
