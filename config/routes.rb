Rails.application.routes.draw do
  root to: 'pages#index'

  resources :pages
  resources :activities
       
  devise_for :users, 
             :controllers => {
               :registrations => "users/registrations", 
               :omniauth_callbacks => "users/omniauth_callbacks" 
             }


end
