Rails.application.routes.draw do
  root to: 'pages#index'

  resources :pages
  resources :activities
       
  devise_for :users, 
             :controllers => {
               :registrations => "users/registrations", 
               :omniauth_callbacks => "users/omniauth_callbacks" 
             }


  resources :orders, only:[:index, :show, :create, :destroy]

  resource :cart, only:[:index, :destroy] do
    collection do
      post :add, path:'add/:id'
    end
  end

end
