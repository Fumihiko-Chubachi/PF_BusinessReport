class Admin::DepartmentsController < ApplicationController

  def index
    @departments = Department.all
    @department = Department.new
  end

  def edit
  end

  def create
    @department = Department.new(department_params)
    @department.save
    redirect_to admin_departments_path
  end

  def update
  end

  private

  def department_params
    params.require(:department).permit(:name)
  end

end
