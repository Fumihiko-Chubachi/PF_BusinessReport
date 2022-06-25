class Public::UsersController < ApplicationController

  def show
    #user_idカラム絞り込みのインスタンス変数
    @work_user = Work.where(user_id: current_user.id)
    @work_user_unanswered = @work_user.unanswered
    @work_user_checking = @work_user.checking
    @work_user_examination = @work_user.examination
    @work_user_possible = @work_user.possible
    @work_user_impossible = @work_user.impossible
    @work_user_in_progress = @work_user.in_progress
    @work_user_completion = @work_user.completion

    #to_user_idカラム絞り込みのインスタンス変数
    @work_to_user = Work.where(to_user_id: current_user.id)
    @work_to_user_unanswered = @work_to_user.unanswered
    @work_to_user_checking = @work_to_user.checking
    @work_to_user_examination = @work_to_user.examination
    @work_to_user_possible = @work_to_user.possible
    @work_to_user_impossible = @work_to_user.impossible
    @work_to_user_in_progress = @work_to_user.in_progress
    @work_to_user_completion = @work_to_user.completion
  end

  private

  def user_params
    params.require(:user).permit(:department_id, :employee_code, :position, :email, :name)
  end

  def work_params
    params.require(:work).permit(:user_id, :to_user_id, :title, :purpose, :background, :body, :progress_status)
  end

end