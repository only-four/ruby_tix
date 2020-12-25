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

  # 主辦方設定票券寫在activity new 頁面 暫定
  resources :activities, only:[] do
    resources :ticket_types
  end

  resources :ticket_types, only:[ :choose_ticket]

  resources :tickets
  #使用者選則票券頁面
  # get "/ticket_types/choose_ticket", to: "ticket_types#choose_ticket"
end
