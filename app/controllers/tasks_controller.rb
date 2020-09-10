class TasksController < ApplicationController
  before_action :set_task, only: %i[update destroy]

  def index
    @task_filter = params[:task_filter] ? params[:task_filter] : 'all'

    @tasks     = Task.filter_by(@task_filter)
    @new_task  = Task.new
    @active_tasks_count = Task.active.count
    @completed_tasks_count = Task.completed.count
  end

  def create
    Task.create! task_params

    redirect_to action: :index
  end

  def update
    @task.update! task_params

    redirect_to action: :index
  end

  def destroy
    @task.destroy

    redirect_to action: :index
  end

  private

  def set_task
    @task = Task.find params[:id]
  end

  def task_params
    params.require(:task).permit(:title)
  end
end
