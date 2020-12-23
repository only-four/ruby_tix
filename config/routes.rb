Rails.application.routes.draw do
  devise_for :users, 
             :controllers => {
               :registrations => "users/registrations", 
               :omniauth_callbacks => "users/omniauth_callbacks" 
             }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pages
  resources :activities
  root to: 'pages#index'

  resources :orders, only:[:index, :show, :create, :destroy]

  resource :cart, only:[:index, :destroy] do
    collection do
      post :add, path:'add/:id'
    end
  end

  # 主辦方設定票券  
  resources :activities, only:[] do
    resources :ticket_types, except: [:show]
  end

  #使用者選則票券頁面
  resources :ticket_types, only: [:choose_ticket]
end
