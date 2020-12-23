Rails.application.routes.draw do
  devise_for :users, 
             :controllers => {
               :registrations => "users/registrations", 
               :omniauth_callbacks => "users/omniauth_callbacks" 
             }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pages
  root to: 'pages#index'

  resources :orders, only:[:index, :show, :new, :create, :destroy]

  resource :cart, only:[:index, :destroy] do
    collection do
      post :add, path:'add/:id'
    end
  end

end
