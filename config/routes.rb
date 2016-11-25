Rails.application.routes.draw do
  root 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'
  resources :users, except: [:destroy] do
    resources :projects, only: [:create, :show, :destroy], shallow: true do
      resources :tasks, only: [:create, :update, :destroy]
    end
  end
  resources :members, only: [:create]
end
