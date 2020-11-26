Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :parts, only: [ :index, :show, :update, :create ] do
        resources :statistics, only: [ :index, :create, :update ]
      end
    end
  end
end

# Mn8yw2vXtyTNSEgAPBPr
