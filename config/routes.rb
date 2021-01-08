Rails.application.routes.draw do
  resources :chatrooms do
    resource :chatroom_users
    resources :messages
  end
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

  resources :orders, only:[:index, :create, :show, :destroy] do
    member do
      delete :cancel
      post :pay
      get :pay_confirm
    end

    collection do
      get :confirm
    end
  end

  resource :cart, only:[:show, :destroy] do
    collection do
      post :add, path:'add/:id'
    end
    get :checkout
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  namespace :admin do
    resources :users
    resources :activities
  end

  resources :activities, except: [:update] do
    post :join, on: :member
    post :confirm, on: :member  
    delete :cancel, on: :member

    resources :users
    # 主辦方設定票券寫在activity new 頁面 暫定
    resources :ticket_types, :except => [ :show]
    #使用者選則票券頁面
    get "/choose", to: "ticket_types#choose_ticket"
    # 單一活動底下 comment
    resources :comments, only:[:create, :destroy]
  end

  resources :activities_user


  # 訂單成立後顯示個人票券
  resources :tickets, only: [ :create] do
    post 'attend_event', on: :member
    get 'attend_event_result', on: :member
    collection do
      get :my_tickets
    end
  end

  # qr_code reader
  get 'qr_code_reader', to: 'qr_codes#index'

  resources :orders, only:[:index, :show, :create, :destroy]

  resource :cart, only:[:index, :destroy] do
    collection do
      post :add, path:'add/:id'
    end
  end

end