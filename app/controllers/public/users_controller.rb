class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    #user_idカラム絞り込みのインスタンス変数
    @work_user = Work.where(user_id: current_user.id)
    @work_user_unanswered = @work_user.unanswered.order("id DESC")
    @work_user_checking = @work_user.checking.order("id DESC")
    @work_user_examination = @work_user.examination.order("id DESC")
    @work_user_possible = @work_user.possible.order("id DESC")
    @work_user_impossible = @work_user.impossible.order("id DESC")
    @work_user_in_progress = @work_user.in_progress.order("id DESC")
    @work_user_completion = @work_user.completion.order("id DESC")

    #to_user_idカラム絞り込みのインスタンス変数
    @work_to_user = Work.where(to_user_id: current_user.id)
    @work_to_user_unanswered = @work_to_user.unanswered.order("id DESC")
    @work_to_user_checking = @work_to_user.checking.order("id DESC")
    @work_to_user_examination = @work_to_user.examination.order("id DESC")
    @work_to_user_possible = @work_to_user.possible.order("id DESC")
    @work_to_user_impossible = @work_to_user.impossible.order("id DESC")
    @work_to_user_in_progress = @work_to_user.in_progress.order("id DESC")
    @work_to_user_completion = @work_to_user.completion.order("id DESC")
  end

  private

  def user_params
    params.require(:user).permit(:department_id, :employee_code, :position, :email, :name)
  end

  def work_params
    params.require(:work).permit(:user_id, :to_user_id, :title, :purpose, :background, :body, :progress_status)
  end

end