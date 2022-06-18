class Public::WorkCommentsController < ApplicationController

  def create
    work = Work.find(work_comment_params[:work_id])
    work_comment = current_user.work_comments.new(work_comment_params)
    work_comment.work_id = work.id
    if work_comment.save
      redirect_to request.referer
    else
      render '/public/works/id'
    end
  end

  def destroy
    WorkComment.find(params[:id]).delete
    redirect_to request.referer
  end

  private

  def work_comment_params
    params.require(:work_comment).permit(:comment, :work_id)
  end

end