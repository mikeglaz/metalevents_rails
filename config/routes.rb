Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'
  delete '/sign_out', to: 'sessions#destroy'

  get '/sign_up', to: 'users#new'

  get '/account_activation/:token', to: 'account_activation#edit', as: 'activation'


  resources :users
  resources :events
  resources :venues
  resources :password_resets, only: [:new, :create, :edit, :update]

  root 'events#index'
  # root 'welcome#index'
end
