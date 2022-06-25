class Public::DailyreportsController < ApplicationController

  def new
    @dailyreport = Dailyreport.new
  end

  def index
    #positionカラムを参照に表示分け
    if current_user.position == false
      @dailyreports = Dailyreport.where(user_id: current_user.id)
    else
      @dailyreports = Dailyreport.joins(:user).where(user: {department_id: current_user.department_id})
    end
  end

  def show
    @dailyreport = Dailyreport.find(params[:id])
  end

  def edit
    @dailyreport = Dailyreport.find(params[:id])
  end

  def create
    @dailyreport = Dailyreport.new(dailyreport_params)
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
    params.require(:dailyreport).permit(:user_id, :objective, :summary, :introspection, :improvement)
  end

end