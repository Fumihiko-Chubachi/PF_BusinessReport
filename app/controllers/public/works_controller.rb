class Public::WorksController < ApplicationController

  def department
    @departments = Department.all
  end

  def new
    @target_user = User.where(department_id: params[:target_department])
    @work = Work.new
  end

  def show
    @work = Work.find(params[:id])
    @work_comment = WorkComment.new
  end

  def create
    @work = Work.new(work_params)
    @work.user_id = current_user.id
    @work.save
    redirect_to public_works_path
  end

  private

  def work_params
    params.require(:work).permit(:from_user_id, :to_user_id, :title, :purpose, :background, :body, :progress_status)
  end

end