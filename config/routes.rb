Rails.application.routes.draw do
  namespace :apiv1 do
    resources :products, only: :index
  end
  get 'angular/index'
  root 'angular#index'
end
