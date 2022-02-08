class EmployeeController < ApplicationController
  layout 'dashboard'
  def index
  end

  def info
  end

  def list
    @employees = Employee.all
    authorize @employee
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
      if @employee.save!
        format.html { redirect_to epl_list_url, notice: "Thêm nhân viên thành công." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end

    end
  end

  def epl_params
    params.require(:employees).permit(:name, :age, :birthday, :address, :user_id, :role_id)
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def epl_param
    params.require(:employee).permit(:name, :age, :birthday, :address, :user_id, :role_id)
  end

  def update
    @employee = Employee.find(params[:id])
    respond_to do |format|
      if @employee.update(epl_param)
        format.html { redirect_to dpms_list_url, notice: "Cập nhật phòng ban thành công." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def delete
    respond_to do |format|
      Employee.find(params[:id]).destroy
      format.html { redirect_to dpms_list_url, notice: "Xoá phòng ban thành công." }
    end
  end

end
