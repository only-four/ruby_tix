Rails.application.routes.draw do
  resources :chatrooms do
    resource :chatroom_users
    resources :messages
  end
  root to: 'pages#index'

  resources :pages do
    collection do
      get :search
      # 會員服務
      # member  新建
      get :member, to: "pages#member"
        # guide   導覽頁 導流頁  join hold
      get :guide, to: "pages#guide"  
      # 客服中心
        # FAQ  兩個合併
      get :faq, to: "pages#faq"
        # get :service_center , to: "pages#service_center"
        # get :questions , to: "pages#questions"
        # join 更名  參加活動
      get :join, to: "pages#join"
      get :hold, to: "pages#hold"
      # get :purchase , to: "pages#purchase"
        # hold_act  兩個合一
        # get :sales , to: "pages#sales"
      # 關於我們
      get :about_us, to: "pages#about_us"
      get :terms, to: "pages#terms"
    end
  end 

  devise_for :users, 
             :controllers => {
               :registrations => "users/registrations", 
               :omniauth_callbacks => "users/omniauth_callbacks"
             }

  resources :orders, only: [:index, :create, :show, :destroy] do
    member do
      delete :cancel
      post :pay
      get :pay_confirm
    end
    collection do
      get :confirm
    end
  end

  resource :cart, only: [:show, :destroy] do
    collection do
      post :add, path: 'add/:id'
    end
    get :checkout
  end
  
  namespace :admin do
    resources :users
    resources :activities
  end

  resources :activities do
    member do
      post :join
      post :confirm  
      delete :cancel
    end
    
    resources :users
    resources :ticket_types, only: [:index, :destroy]
    resources :comments, only: [:create, :destroy]
    get "/choose", to: "ticket_types#choose_ticket"
  end

  resources :activities_user

  resources :tickets, only: [:create] do
    member do
      post :attend_event
      get :attend_event_result      
    end
    collection do
      get :my_tickets
    end
  end

  get 'qr_code_reader', to: 'qr_codes#reader'
  resources :qr_codes, only: [:create] do
    collection do
      get :scan
      get :attand_list
    end
    member do
      get :participated      
    end
  end
end
