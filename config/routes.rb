Rails.application.routes.draw do
  namespace :apiv1 do
    resources :products, only: :index
  end
  root 'angular#index'
end
