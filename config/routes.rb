Rails.application.routes.draw do

  #顧客用
  #URL /customers/sign_in ...
devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  scope module: :public do
  get 'customer/my_page', to: 'customers#show'
    #顧客新規登録後のマイページへの遷移
  get 'customer/sign_in', to: 'customers#new'
    #顧客サインイン後のマイページへの遷移
  get 'customer/information/edit', to: 'customers#edit'
    #顧客情報編集画面への遷移
  get 'customer/orders', to: 'customers#index'
  end


  #管理者用
  #URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
  get 'top', to: 'homes#top'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
