Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

 scope module: :public do
    resource :customers, only: [:edit, :update]
  end

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


  # 管理者側
  namespace :admin do
    root to: 'homes#top'
    resources :items, only: [:index, :new, :show, :edit, :create, :update]
    resources :genres, only: [:index, :create, :edit, :update,]
    resources :orders, only: [:index, :show, :update]
    resources :orders_items, only: [:update]
    resources :customers, only: [:index, :show, :edit, :update]
  end
  # 顧客側
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all' #カート内全て削除
    resources :items, only: [:index, :show]
    get "/orders/thanx" => "orders#thanx", as: "thanx"
    get "/orders/confirm" => "orders#confirm", as: "confirm"
    resources :orders, only: [:new, :index, :show, :create]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    get '/customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch '/customers/withdraw' => 'customers#withdraw', as: 'withdraw'
    resource :customers, only: [:show]
    resources :genres, only: [:show]

  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
