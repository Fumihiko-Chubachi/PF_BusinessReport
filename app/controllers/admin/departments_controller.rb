class Admin::DepartmentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @departments = Department.all
    @department = Department.new
  end

  def edit
    @department = Department.find(params[:id])
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      redirect_to admin_departments_path
    else
      flash[:notice]="空欄で登録は出来ません。"
      redirect_to request.referer
    end
  end

  def update
    @department = Department.find(params[:id])
    if @department.update(department_params)
      redirect_to admin_departments_path
    else
      flash[:notice]="空欄で保存は出来ません。"
      redirect_to request.referer
    end
  end

  private

  def department_params
    params.require(:department).permit(:name)
  end

end
