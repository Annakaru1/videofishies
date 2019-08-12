Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  resources :users, only: :show   
end

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html