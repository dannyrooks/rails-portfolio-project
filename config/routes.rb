Rails.application.routes.draw do
  
  root to: 'application#welcome'

  resources :locations, only: [:new, :index, :show, :create] do
    resources :reports do
      resources :comments, only: [:create, :new, :show, :delete]
    end
  end

  resources :locations, only: [:show, :index, :new, :create]
    

  # get /most_popular_fishing_spot


  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks'}
  devise_scope :user do 
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
    get 'edit_user_registrations', to: 'registrations#edit'
  end

end
