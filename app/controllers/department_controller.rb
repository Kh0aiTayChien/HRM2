class DepartmentController < ApplicationController
  layout 'dashboard'
  def list
    @dpms = Department.all
    authorize @dpms
  end

  def show
    @dpm = Department.find(params[:id])
    @pm = Employee.find_by(is_pm: "0",department_id: @dpm )


    puts @pm.inspect

    @count= Employee.where(department_id: @dpm).count
  end

  def new
    @dpm = Department.new
    authorize @dpm
  end

  def create
    @dpm = Department.new(dpm_params)
    respond_to do |format|
      if @dpm.save
        format.html { redirect_to dpms_list_url, notice: "Thêm phòng ban thành công." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def dpm_params
    params.require(:departments).permit(:name, :description)
  end

  def edit
    @dpm = Department.find(params[:id])
    authorize @dpm
  end

  def dpm_param
    params.require(:department).permit(:name, :description)
  end

  def update
    @dpm = Department.find(params[:id])
    respond_to do |format|
      if @dpm.update(dpm_param)
        format.html { redirect_to dpms_list_url, notice: "Cập nhật phòng ban thành công." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def delete
    respond_to do |format|
      @dpm = Department.find(params[:id])
      authorize @dpm
      @dpm.destroy
      format.html { redirect_to dpms_list_url, notice: "Xoá phòng ban thành công." }
    end
  end

  def show_project
    @prj = Project.find(params[:id])
  end

  def show_epl
    @employee = Employee.find(param[:id])
  end
end
