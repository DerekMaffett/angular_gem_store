Rails.application.routes.draw do
  devise_for :admins
  namespace :apiv1 do
    resources :products, except: [:show, :new, :edit] do
      resources :reviews, except: [:show, :new, :edit]
    end
  end
  get 'angular/index'
  root 'angular#index'
end
