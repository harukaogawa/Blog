Rails.application.routes.draw do
  root 'home#index'
  # onlyを削除
  resources :posts
end