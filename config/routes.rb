Rails.application.routes.draw do
  root to: 'pages#index'

  resources :pages do
    # 沒id
    collection do
      get :search
      get :footer_page
    end
  end 

  devise_for :users, 
             :controllers => {
               :registrations => "users/registrations", 
               :omniauth_callbacks => "users/omniauth_callbacks"
             }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :activities do
    # 主辦方設定票券寫在activity new 頁面 暫定
    resources :ticket_types, :except => [ :show]
    #使用者選則票券頁面
    get "/ticket_types/choose_ticket", to: "ticket_types#choose_ticket"
    # 單一活動底下 comment
    resources :comments, only:[:create, :destroy]
  end
  
  # 訂單成立後顯示個人票券
  resources :tickets, only: [ :create] do
    post 'attend_event', on: :member
    collection do
      get :my_tickets
      get :attend_event_result
    end
  end

  resources :orders, only:[:index, :show, :create, :destroy]

  resource :cart, only:[:index, :destroy] do
    collection do
      post :add, path:'add/:id'
    end
  end

end