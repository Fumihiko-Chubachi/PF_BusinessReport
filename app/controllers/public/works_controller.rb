class Public::WorksController < ApplicationController
  
  def new
    @work = Work.new
  end
  
  def create
    @work = Work.new(work_params)
    @work.from_user_id = current_user.id
    byebug
    @work.save
    redirect_to root_path
  end
  
  private

  def work_params
    params.require(:work).permit(:from_user_id, :to_user_id, :title, :purpose, :background, :body, :progress_status)
  end
  
end