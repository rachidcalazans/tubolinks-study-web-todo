Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :tasks, except: %i[edit new show]
  resources :completed_task_cleanings, only: %i[create]
  resources :completed_tasks, only: %i[create destroy]
end
