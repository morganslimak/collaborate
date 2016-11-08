Rails.application.routes.draw do
  root 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'
  resources :users, except: [:destroy] do
    resources :projects, shallow: true do
      resources :tasks, only: [:create]
    end
  end
  resources :members, only: [:create]
end
