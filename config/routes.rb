Rails.application.routes.draw do
  get 'products' => 'products#index'
  root 'products#index'
end
