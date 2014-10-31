Rails.application.routes.draw do
  namespace :apiv1 do
    resources :products, except: [:show, :new, :edit]
  end
  get 'angular/index'
  root 'angular#index'
end
