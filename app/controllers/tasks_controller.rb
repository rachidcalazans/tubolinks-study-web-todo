class TasksController < ApplicationController

  def index
    @tasks = Task.all
    @new_task  = Task.new
  end

  def create
    title = params[:task][:title]

    @task = Task.new(title: title).tap(&:save!)
  end

  def show
    @task = Task.first
  end
end
