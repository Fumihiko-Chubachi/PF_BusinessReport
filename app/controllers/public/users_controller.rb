class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @work = Work.find(params[:id])
    @works = @user.works
  end

  private

  def user_params
    params.require(:user).permit(:department_id, :employee_code, :position, :email, :name)
  end

  def work_params
    params.require(:work).permit(:user_id, :to_user_id, :title, :purpose, :background, :body, :progress_status)
  end

end