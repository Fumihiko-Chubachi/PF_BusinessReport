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
  
  def edit
    @work = Work.find(params[:id])
  end

  def create
    @work = Work.new(work_params)
    @work.user_id = current_user.id
    if @work.save
       redirect_to public_user_path(current_user.id)
    else
       flash[:notice]="空欄の箇所があります。"
       redirect_to request.referer
    end
  end

  def update
    @work = Work.find(params[:id])
    if @work.update(work_params)
      redirect_to request.referer
    else
      flash[:notice]="空欄の箇所があります。"
      redirect_to request.referer
    end
  end

  def destroy
    @work = Work.find(params[:id])
    @work.delete
    redirect_to public_user_path(current_user.id)
  end

  private

  def work_params
    params.require(:work).permit(:user_id, :to_user_id, :title, :purpose, :background, :body, :progress_status)
  end

end