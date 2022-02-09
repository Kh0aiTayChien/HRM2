class EmployeeController < ApplicationController
  layout 'dashboard'
  def index
  end

  def info
  end

  def list
    @employees = Employee.all
  end

  def show
    # @employee = Employee.includes(:employee_file).where(id: params[:id]).first
    # @employee.employee_file
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
    @employee.build_employee_file
  end

  def create
    @employee = Employee.new(epl_params_create)
    respond_to do |format|
      if @employee.save!
        format.html { redirect_to epl_list_url, notice: "Thêm nhân viên thành công." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end

    end
  end


  def epl_params_create
    params
          .require(:employee)
          .permit(:name, :age, :birthday, :address, :user_id, :role_id, :department_id, :is_pm,
                  employee_file_attributes: [:position, :time_onboard] )

  end

  def edit
    @employee = Employee.find(params[:id])

  end


  def epl_param_update
    params
      .require(:employee)
      .permit(:name, :age, :birthday, :address, :user_id, :role_id, :department_id, :is_pm,
              employee_file_attributes: [:id,:position, :time_onboard] )

  end

  def update
    @employee = Employee.find(params[:id])
    respond_to do |format|
      if @employee.update(epl_param_update)
        format.html { redirect_to epl_list_url, notice: "Cập nhật thông tin nhân viên thành công." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def delete
    respond_to do |format|
      Employee.find(params[:id]).destroy
      format.html { redirect_to epl_list_url, notice: "Xóa nhân viên thành công." }
    end
  end

end
