Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :tasks, except: %i[edit new show]
  resources :completed_task_cleanings, only: %i[create]
  resources :completed_tasks, only: %i[create destroy]

  get 'active_tasks/tray', to: 'active_tasks#tray', as: 'active_tasks_tray'
  get 'completed_tasks/tray', to: 'completed_tasks#tray', as: 'completed_tasks_tray'
end
