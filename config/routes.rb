Rails.application.routes.draw do
  devise_for :users, 
             :controllers => {
               :registrations => "users/registrations", 
               :omniauth_callbacks => "users/omniauth_callbacks"
             }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pages do
    # 沒id
    collection do
      get :search
    end
  end
  

  root to: 'pages#index'

end
