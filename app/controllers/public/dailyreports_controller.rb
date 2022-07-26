class Public::DailyreportsController < ApplicationController
  before_action :authenticate_user!

  def new
    @dailyreport = Dailyreport.new
  end

  def index
    #positionカラムを参照に表示分け
    if current_user.position == false
      @dailyreports = Dailyreport.where(user_id: current_user.id).order("id DESC").page(params[:page])
    else
      @dailyreports = Dailyreport.joins(:user).where(user: {department_id: current_user.department_id}).order("id DESC").page(params[:page])
    end
  end

  def show
    @dailyreport = Dailyreport.find(params[:id])
    @dailyreport_comment = DailyreportComment.new
  end

  def edit
    @dailyreport = Dailyreport.find(params[:id])
  end

  def create
    @dailyreport = Dailyreport.new(dailyreport_params)
    @dailyreport.score = Language.get_data(dailyreport_params[:impression]) #感情分析スコア
    
    @dailyreport.user_id = current_user.id
    if @dailyreport.save
      redirect_to public_dailyreports_path
    else
      flash[:notice]="空欄の箇所があります。"
      redirect_to request.referer
    end
  end

  def update
    @dailyreport = Dailyreport.find(params[:id])
    if @dailyreport.update(dailyreport_params)
      redirect_to public_dailyreports_path
    else
      flash[:notice]="空欄の箇所があります。"
      redirect_to request.referer
    end
  end

  def destroy
    @dailyreport = Dailyreport.find(params[:id])
    @dailyreport.delete
    redirect_to public_dailyreports_path
  end

  private

  def dailyreport_params
    params.require(:dailyreport).permit(:user_id, :objective, :summary, :introspection, :improvement, :impression)
  end

end