Rails.application.routes.draw do

  #顧客用
  #URL /customers/sign_in ...
devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  scope module: :public do

  get 'homes/top', to: 'homes#top'
  get 'homes/about', to: 'homes#about'
  resources :items, only: [:new, :create, :show, :index, :edit, :update]
  resources :cart_items, only: [:new, :create, :show, :index, :update, :destroy]

  get 'customer/my_page', to: 'customers#show'
    #顧客新規登録後のマイページへの遷移
  get 'customer/sign_in', to: 'customers#new'
    #顧客サインイン後のマイページへの遷移
  get 'customer/information/edit', to: 'customers#edit'
    #顧客情報編集画面への遷移
  get 'customer/orders', to: 'customers#index'

  get 'order/new', to: 'orders#new'


  patch 'customer/withdraw', to: 'customers#withdraw'
    #顧客の退会ステータス
  delete 'destroy_all_cart_items', to: 'cart_items#destroy_all', as: 'destroy_all_cart_items'

  end


  #管理者用
  #URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
  get 'top', to: 'homes#top'
  get 'customers', to: 'customers#index'
  resources :items, only: [:new, :create, :show, :index, :edit, :update]

    #商品詳細画面遷移
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
