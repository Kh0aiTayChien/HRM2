class ProjectController < ApplicationController
  layout 'dashboard'
  def list
    @projects = Project.all
    authorize @projects
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
    authorize @project
  end

  def create
    @project = Project.new(project_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to prj_list_url, notice: "Thêm dự án thành công." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def project_params
    params.require(:projects).permit(:name, :description, :department_id)
  end

  def edit
    @project = Project.find(params[:id])
    authorize @project
  end

  def project_param
    params.require(:project).permit(:name, :description, :department_id)
  end

  def update
    @project = Project.find(params[:id])
    respond_to do |format|
      if @project.update(project_param)
        format.html { redirect_to prj_list_url, notice: "Cập nhật dự án thành công." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def delete
    respond_to do |format|
      @prj = Project.find(params[:id])
      authorize @prj
      @prj.destroy
      format.html { redirect_to prj_list_url, notice: "Xoá dự án thành công." }
    end
  end
end
