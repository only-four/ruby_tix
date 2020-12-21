Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'admin/tickets#index'
  
  # 票券顯示
  resources :tickets, only: [:index, :show]
  
  # 後台票券crud
  namespace :admin do
    resources :tickets, except: [:show]
  end
end
