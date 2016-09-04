Rails.application.routes.draw do

  root :to => 'accounts#index'

  resources :accounts , only: [:index, :edit, :update, :new, :create]
  resources :users # index new create edit update accounts destroy
  resources :appointments , only: [:edit, :update, :new, :create]
  resources :contacts, only: [:destroy, :edit, :update, :new, :create]

  resources :accounts do
    resources :contacts, only: [:destroy]
  end

  get 'contacts' => 'contacts#index', :as => :contacts_list

  resources :user_sessions # index new create edit update accounts destroy
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

end
