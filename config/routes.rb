Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "homes#top"
  devise_for :users
  get "home/about"=>"homes#about"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    #単数形にすると、/:idがURLに含まれなくなる。
    resource :favorite, only: [:create, :destroy]
    #ネストする。
    resources :book_comments, only: [:create, :destroy]
   end
  
  resources :users, only: [:index,:show,:edit,:update]

  
  
end