class EmployeeProjectController < ApplicationController

  layout 'dashboard'
  def index
    @project = Project.find(params[:id])
    # authorize @project
    @employees = EmployeeProject.where(:project_id => @project.id)
  end

  def show
  end

  def new
    @project = Project.find(params[:id])
    @employees_project = EmployeeProject.new
    @employees = Employee.all
  end

  def create
    @employees_project = EmployeeProject.new(project_employee_params)

    # @project = Project.find(params[:id])


      if @employees_project.save!
        flash[:message] = "Them moi thanh cong"
        redirect_to employee_project_index_path(id: @employees_project.project_id)
      else

       render :new, status: :unprocessable_entity
      end
  end

  def project_employee_params
    params
      .require(:employee_project)
      .permit(:time_assign,:is_leader, :project_id, :employee_id,)
  end

  def edit
    @employees_project = EmployeeProject.find(params[:id])
  end

  def update_param
    params.require(:employee_project).permit(:time_assign)
  end

  def update
    @employees_project = EmployeeProject.find(params[:id])
    respond_to do |format|
      if @employees_project.update(update_param)
        format.html { redirect_to employee_project_index_path(id: @employees_project.project_id), flash[:message] = "Them moi thanh cong"  }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy

    respond_to do |format|
      EmployeeProject.find(params[:id]).destroy!
      # format.html { redirect_to employee_project_index, notice: "Xoá nhan vien khoi du an thành công." }
      end
  end
end
