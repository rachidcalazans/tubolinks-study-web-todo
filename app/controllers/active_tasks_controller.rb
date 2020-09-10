class ActiveTasksController < ApplicationController
  def tray
    @active_tasks_count = Task.active.count
    render layout: false
  end
end
