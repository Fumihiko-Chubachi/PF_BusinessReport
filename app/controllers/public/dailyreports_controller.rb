class Public::DailyreportsController < ApplicationController
  
  def new
    @dailyreport = Dailyreport.new
  end
  
  def index
  end
  
  def show
  end
  
  def create
    @dailyreport = Dailyreport.new(dailyreport_params)
    @dailyreport.user_id = current_user.id
    @dailyreport.save
    redirect_to root_path
  end
  
  def update
  end
  
  private

  def dailyreport_params
    params.require(:dailyreport).permit(:user_id, :objective, :summary, :introspection, :improvement)
  end
  
end