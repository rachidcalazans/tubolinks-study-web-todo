module TasksHelper
  def selected_filter(link_name, current_filter)
    'selected' if current_filter == link_name
  end

  def link_tab_filter(title, task_to_filter, current_filter)
    link_to title, tasks_path(task_filter: task_to_filter), id: task_to_filter, class: selected_filter(task_to_filter, current_filter)
  end
end
