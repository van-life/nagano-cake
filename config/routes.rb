Rails.application.routes.draw do

  namespace :customer do
    get 'cart_items/index'
  end
  root to: 'customer/customers#top'
  get 'about' => 'customer/customers#about'

  scope module: :customer do
    resource :customers, only: [:show, :edit, :update]

    get 'customers/quit' => 'customers#quit'
    patch 'customers/out' => 'customers#out'

    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete 'cart_items' => 'cart_items#all_destroy'

    resources :c_orders, only: [:index, :new, :create, :show, :update] do
      collection do 
        post 'confirm'
        get 'thanks'
      end
    end

    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
    resources :c_items, only: [:index, :show]
 end

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :a_items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :a_orders, only: [:index, :show]
    patch 'a_orders/:id/order' => 'a_orders#order_status'
    patch 'a_orders/:id/item' => 'a_orders#item_status'
  end

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords,], controllers: {
    registrations: "customer/registrations",
    sessions: 'customer/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

end


