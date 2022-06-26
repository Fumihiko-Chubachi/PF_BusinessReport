class Public::DailyreportCommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    dailyreport = Dailyreport.find(dailyreport_comment_params[:dailyreport_id])
    dailyreport_comment = current_user.dailyreport_comments.new(dailyreport_comment_params)
    dailyreport_comment.dailyreport_id = dailyreport.id
    if dailyreport_comment.save
      redirect_to request.referer
    else
      flash[:notice]="コメントは空欄に出来ません。"
      redirect_to request.referer
    end
  end

  def destroy
    DailyreportComment.find(params[:id]).delete
    redirect_to request.referer
  end

  private

  def dailyreport_comment_params
    params.require(:dailyreport_comment).permit(:comment, :dailyreport_id)
  end
  
end