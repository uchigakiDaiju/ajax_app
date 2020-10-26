Rails.application.routes.draw do
  
  #[HTTPメソッド] '[URIパターン]', to:'[コントローラー名]#[アクション名]'
  root to: 'posts#index'
  # get 'posts/new', to: 'posts#new' #使わないので削除
  post 'posts', to: 'posts#create'
end
