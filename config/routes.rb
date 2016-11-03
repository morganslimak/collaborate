Rails.application.routes.draw do
  root 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'
  resources :users, only: [:new, :create, :show] do
    resources :projects, shallow: true do
      resources :tasks, only: [:create]
    end
  end
end
