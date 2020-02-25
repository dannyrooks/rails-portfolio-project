Rails.application.routes.draw do
  
  root to: 'application#welcome'

  resources :locations, only: [:new, :index, :show, :create] do
    resources :reports  
  end

  resources :locations, only: [:show, :index, :new, :create] do
    resources :states, only: [:index]
  end

  resources :reports

  get 'reports/order_by_recent', to: 'application#title'
  get 'location/order', to: 'application#name'


  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks'}
  devise_scope :user do 
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
    get 'edit_user_registrations', to: 'registrations#edit'
  end

end
