Rails.application.routes.draw do
  get 'posts', to: 'posts#index'

  # 投稿ページを表示
  get 'posts/new', to: 'posts#new'

  # 投稿データ作成
  post 'posts', to: 'posts#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
