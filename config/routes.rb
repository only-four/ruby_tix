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

  resources :activities do
    post :join, on: :member
    post :confirm, on: :member  
    delete :cancel, on: :member

    resources :users
  
    resources :ticket_types, only:[:index, :destroy]
    get "/choose", to: "ticket_types#choose_ticket"
    resources :comments, only:[:create, :destroy]
  end

  resources :activities_user

  resources :tickets, only: [ :create] do
    member do
      post :attend_event
      get :attend_event_result      
    end
    collection do
      get :my_tickets
    end
  end

  # qr_code reader
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

  resources :orders, only:[:index, :show, :create, :destroy]

  resource :cart, only:[:index, :destroy] do
    collection do
      post :add, path:'add/:id'
    end
  end

end