Rails.application.routes.draw do
  
  root to: 'application#welcome'

  resources :states, only: [:index]

  resources :locations do
    resources :reports
  end

  #/most_popular_fishing_spot


  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks'}
  devise_scope :user do 
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
    get 'edit_user_registrations', to: 'registrations#edit'
  end

end
