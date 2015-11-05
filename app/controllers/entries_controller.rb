class EntriesController < ApplicationController

  def index
    @project = Project.find_by(id: params[:project_id])
    if @project.nil?
      render "shared/error"
      # NO render 'index'
    else
      @total_time = @project.total_time
      @entries = @project.entries
      # render 'index'
    end
  end

  def new
    @project = Project.find_by(id: params[:project_id])
    @entry = Entry.new
  end

  def create
    project_id = params[:project_id]
    @project = Project.find_by(id: project_id)
    @entry = @project.entries.new(entry_params)
    if @entry.save
      redirect_to project_entries_path(@project.id)
    else
      # render "new"
      flash["errors"] = @entry.errors.full_messages
      redirect_to new_project_entry_path(@project.id)
    end
  end

  def edit
    @entry = Entry.find_by(id: params[:id])
  end

  def update
    entry = Entry.find_by(id: params[:id])
    if entry.update(entry_params)
      redirect_to project_entries_path(entry.project_id)
    else
      render "edit"
    end
  end

  def destroy
    entry = Entry.find_by(id: params[:id])
    entry.destroy
    redirect_to project_entries_path(entry.project_id)
  end

  private

  def entry_params
    params.require(:entry).permit(:hours, :minutes, :date, :comment)
  end
end
