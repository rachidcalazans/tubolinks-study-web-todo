class TasksController < ApplicationController

  def index
    @tasks = Task.all
    @new_task  = Task.new
  end

  # @todo - use full turbolinks. Redirecting to index
  #       - remove the create.js.erb file
  #       - use redirect_to action: :index
  def create
    title = params[:task][:title]

    @task = Task.new(title: title).tap(&:save!)
  end

  def show
    @task = Task.first
  end
end
