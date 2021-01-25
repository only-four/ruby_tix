Rails.application.routes.draw do
  resources :chatrooms do
    resource :chatroom_users
    resources :messages
  end
  root to: 'pages#index'

  resources :pages do
    collection do
      get :search
      get :member, to: "pages#member"
      get :guide, to: "pages#guide"  
      get :faq, to: "pages#faq"
      get :join, to: "pages#join"
      get :hold, to: "pages#hold"
      get :about_us, to: "pages#about_us"
      get :terms, to: "pages#terms"
      get :privacy, to: "pages#privacy"
    end
  end 

  resource :favorite, only: [:index, :create, :show]

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

    member do
      post :favorite
    end

    collection do
      get :my_favorite
    end
    
    resources :users
    resources :ticket_types, only: [:index, :destroy]
    resources :comments, only: [:create, :destroy]
    get "/choose", to: "ticket_types#choose_ticket"
    resources :qr_codes, only: [] do
      collection do
        get :scan
        get :attand_list
      end
      member do
        get :participated      
      end
    end    
  end

  resources :categories

  resources :activities_user

  resources :tickets, only: [:create] do
    member do
      post :attend_event
      get :attend_event_result      
    end
  end
  get "/tickets/my", to: "tickets#my_tickets"

  resources :qr_codes, only: [:create] do
    collection do
      post :manual_attand
    end
  end

  resources :seats, only: [:show, :update]
end
