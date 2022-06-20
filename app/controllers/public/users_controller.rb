class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @works = @user.works
    @work = Work.where(to_user_id: current_user.id)
    @work_unanswered = @work.unanswered
    @work_checking = @work.checking
    @work_examination = @work.examination
    @work_possible = @work.possible
    @work_impossible = @work.impossible
    @work_in_progress = @work.in_progress
    @work_completion = @work.completion
  end

  private

  def user_params
    params.require(:user).permit(:department_id, :employee_code, :position, :email, :name)
  end

  def work_params
    params.require(:work).permit(:user_id, :to_user_id, :title, :purpose, :background, :body, :progress_status)
  end

end