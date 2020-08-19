class TasksController < ApplicationController

  def index
    @tasks = Task.all
    @new_task  = Task.new
  end

  def create
    title = params[:task][:title]

    Task.new(title: title).tap(&:save!)

    redirect_to action: :index
  end

  def destroy
    task = Task.find params[:id]

    task.destroy

    redirect_to action: :index
  end
end
