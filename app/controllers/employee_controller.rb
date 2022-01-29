class EmployeeController < ApplicationController
  def index
  end

  def list
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(epl_params)
    respond_to do |format|
      if @employee.save
        format.html { redirect_to epl_list_url, notice: "Thêm phòng ban thành công." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def epl_params
    params.require(:employees).permit(:name, :age, :birthday, :address, :user_id)
  end

  # def edit
  #   @dpm = Department.find(params[:id])
  # end
  #
  # def dpm_param
  #   params.require(:department).permit(:name, :description)
  # end
  #
  # def update
  #   @dpm = Department.find(params[:id])
  #   respond_to do |format|
  #     if @dpm.update(dpm_param)
  #       format.html { redirect_to dpms_list_url, notice: "Cập nhật phòng ban thành công." }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # def delete
  #   respond_to do |format|
  #     Department.find(params[:id]).destroy
  #     format.html { redirect_to dpms_list_url, notice: "Xoá phòng ban thành công." }
  #   end
  # end

end
