Rails.application.routes.draw do
  
  root to: 'locations#index'

  # resources :reports

  resources :locations
  
  
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks'}
  devise_scope :user do 
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end

  
end
