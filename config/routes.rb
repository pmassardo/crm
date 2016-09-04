Rails.application.routes.draw do



  root :to => 'accounts#index'

  # resources :contacts  # index new create edit update accounts destroy
  resources :accounts  # index new create edit update accounts destroy
  resources :users # index new create edit update accounts destroy
  resources :appointments
  resources :contacts, only: [:destroy, :edit, :update, :new, :create]

  # get 'appointments/new'
  # post 'appointments/create'
  # get '/appointments/:id/edit'
  # post 'appointments/update'

  # resources :appointments do
  #   collection do
  #     get "/schedule/data", action: :schedule, as: :schedule
  #   end
  # end

  resources :accounts do
    resources :contacts, only: [:destroy]
  end

  get 'contacts' => 'contacts#index', :as => :contacts_list

  # resources :contacts, only: [:index]

  resources :user_sessions # index new create edit update accounts destroy
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

end
