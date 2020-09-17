class CompletedTaskCleaningsController < ApplicationController
  def create
    Task.completed.delete_all

    redirect_back fallback_location: tasks_path
  end
end
