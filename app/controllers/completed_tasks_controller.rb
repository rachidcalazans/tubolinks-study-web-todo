class CompletedTasksController < ApplicationController
  before_action :set_task

  def create
    @task.mark_as_completed

    render_with(:created)
  end

  def destroy
    @task.mark_as_active

    render_with(:ok)
  end

  private

    def set_task
      @task = Task.find(params[:id])
    end

    def render_with(status, json = {})
      render status: status, json: json.to_json
    end
end

