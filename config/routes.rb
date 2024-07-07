Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'hello/index' => 'hello#index'
#追記ここから
  get 'hello/link' => 'hello#link'
#ここまで
  #ここまで
  root 'hello#index'
  # :createを追加
  
  resources :tweets
end