Rails.application.routes.draw do

  #顧客用
  #URL /customers/sign_in ...
devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  scope module: :public do

  get 'top', to: 'homes#top'
  get 'about', to: 'homes#about'
  resources :items, only: [:new, :create, :show, :index, :edit, :update]
  resources :cart_items, only: [:new, :create, :show, :index, :update, :destroy]
  resources :orders, only: [:new, :create, :index, :show]
  resources :customers, only: [:new, :edit, :show]

  post 'orders/confirm', to: 'orders#confirm'

  get 'complete', to: 'orders#complete'

  patch 'customer/my_page', to: 'customers#update', as: 'customer_my_page'

  get 'customer/sign_in', to: 'customers#new'
    #顧客サインイン後のマイページへの遷移
  get 'customer/information/edit', to: 'customers#edit'
    #顧客情報編集画面への遷移
  get 'customer/orders', to: 'customers#index'

  get 'customer/confirm', to: 'customers#confirm'

  patch 'customer/:id/withdraw', to: 'customers#withdraw',as: 'customer_withdraw'
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
  resources :customers, only: [:index, :show, :edit, :update]
  resources :items, only: [:new, :create, :show, :index, :edit, :update]
  resources :orders, only: [:index, :show]

  delete 'admin/sign_out', to: 'admin/sessions#destroy', as: :destroy_admin_session

  #delete 'sign_out', to: 'sessions#destroy_admin_session', as: :destroy_admin_session
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
