Rails.application.routes.draw do

  root :to => 'user_sessions#new'

  # resources :contacts  # index new create edit update accounts destroy
  resources :accounts  # index new create edit update accounts destroy
  resources :users # index new create edit update accounts destroy

  resources :accounts do
    resources :contacts, only: [:destroy]
  end


  resources :user_sessions # index new create edit update accounts destroy
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

end
