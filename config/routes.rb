Rails.application.routes.draw do
  root to: 'pages#index'

  resources :pages do
    collection do
      get :search
      get :abouts_us , to: "pages#abouts_us"
      get :footer_notice , to: "pages#footer_notice"
      get :process , to: "pages#process_method"
      get :questions , to: "pages#questions"
      get :sell_purchase , to: "pages#sell_purchase"
      get :service_centre , to: "pages#service_centre"
      get :dervice_terms , to: "pages#dervice_terms"
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

  resources :qr_codes, only: [:create] do
    collection do
      post :manual_attand
    end
  end

  resources :seats, only: [:show]
end
