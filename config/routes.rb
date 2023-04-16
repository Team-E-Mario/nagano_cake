Rails.application.routes.draw do

  # 管理者側
  namespace :admin do
    root to: 'homes#top'
  end
  # 顧客側
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :cart_items, only: [:index, :create, :update, :destroy]
    resources :items, only: [:index, :show]
    get "/orders/thanx" => "orders#thanx", as: "thanx"
    get "/orders/confirm" => "orders#confirm", as: "confirm"
    resources :orders, only: [:new, :index, :show, :create]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
