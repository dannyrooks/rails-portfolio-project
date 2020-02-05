Rails.application.routes.draw do
  
  root to: 'application#welcome'

  resources :reports

  resources :locations do
    resources :reports, only: [:show, :new, :create]
  end
  
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks'}
  devise_scope :user do 
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end

  
end
