class Public::WorksController < ApplicationController
  
  def department
    @departments = Department.all
  end
  
  def new
    @target_user = User.where(department_id: params[:target_department])
    @work = Work.new
  end
  
  def create
    @work = Work.new(work_params)
    @work.from_user_id = current_user.id
    @work.save
    redirect_to root_path
  end
  
  def show
    
  end
  
  private

  def work_params
    params.require(:work).permit(:from_user_id, :to_user_id, :title, :purpose, :background, :body, :progress_status)
  end
  
end