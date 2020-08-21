class CompletedTasksController < ApplicationController
  def create
    Task.find(params[:task_id]).mark_as_completed

    render status: :created, json: {}.to_json
  end
end

