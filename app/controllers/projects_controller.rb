class ProjectsController < ApplicationController

  def index
    @projects = Project.all
    # @projects = Project.where("priority > 10")
    render template: "shared/error" if @projects.empty?
    # render :index
  end

  def show
    id = params["id"]
    @project = Project.find_by(id: id)
    # render "no_project_found" if @project.nil?
    render template: "shared/error" if @project.nil?
    # render "show"
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to "/projects"
    else
      flash["errors"] = @project.errors.full_messages
      redirect_to new_project_path
      # render "new"
    end
  end

  def edit
    @project = Project.find_by(id: params[:id])
  end

  def update
    project = Project.find_by(id: params[:id])

    if project.update(project_params)
      flash["notice"] = "Project updated successfully"
      redirect_to projects_path
    else
      flash["errors"] = project.errors.full_messages
      redirect_to edit_project_path(project)
    end
  end

  def destroy
    project = Project.find_by(id: params[:id])
    project.destroy
    flash["notice"] = "Project succesfully removed"
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :priority)
  end
end
