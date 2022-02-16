class DepartmentsController < ApplicationController
  layout 'dashboard'
  def index
    @dpms = Department.all
    authorize @dpms
  end

  def show
    @dpm = Department.find(params[:id])
  end

  def new
    @dpm = Department.new
    authorize @dpm
  end

  def create
    @dpm = Department.new(dpm_params)
    respond_to do |format|
      if @dpm.save
        format.html { redirect_to departments_path, notice: "Thêm phòng ban thành công." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @dpm = Department.find(params[:id])
    authorize @dpm
  end


  def update
    @dpm = Department.find(params[:id])
    respond_to do |format|
      if @dpm.update(dpm_param)
        format.html { redirect_to department_index_path, notice: "Cập nhật phòng ban thành công." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      @dpm = Department.find(params[:id])
      authorize @dpm
      @dpm.destroy
      format.html { redirect_to departments_path, notice: "Xoá phòng ban thành công." }
    end
  end

  def show_project
    @prj = Project.find(params[:id])
  end

  def show_epl
    @employee = Employee.find(param[:id])
  end

  private

  def dpm_params
    params.require(:departments).permit(:name, :description)
  end

  def dpm_param
    params.require(:department).permit(:name, :description)
  end


end
