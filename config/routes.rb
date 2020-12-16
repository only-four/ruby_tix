Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'admin/tickets#index'
  resources :tickets, only: [:index, :show]
  namespace :admin do
    resources :tickets, except: [:show]
  end
end
