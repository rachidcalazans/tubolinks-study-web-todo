class TasksController < ApplicationController
  before_action :set_task, only: %i[update destroy]

  def index
    @tasks = Task.all
    @new_task  = Task.new
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
