Rails.application.routes.draw do
  get 'relationships/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "homes#top"
  devise_for :users
  get "home/about"=>"homes#about"
  
  #ネストする
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    #単数形にすると、/:idがURLに含まれなくなる。
    resource :favorite, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
   end
  
  #ネストする
  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  
  
end