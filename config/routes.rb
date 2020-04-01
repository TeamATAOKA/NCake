Rails.application.routes.draw do
  get 'home/top'
  get 'home/about'
  get 'home/thanks'
  devise_for :users
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users,  only: [:edit, :show, :update, :withdrawal] do
    resources :orders, only: [:index, :show, :new, :create]
    resources :order_items, only: [:create]
    resources :cart_items
    resources :posts
  end

      namespace :admin do
        resources :users, only: [:index, :show, :edit, :update] do
          resources :orders, only: [:index, :show, :update]
          resources :order_items, only: [:update]
        end
      end

  resources :items, only: [:index, :show]
    namespace :admin do
      resources :items, only: [:index, :show, :new, :create, :edit, :update]
    end
  namespace :admin do
    resources :genres
  end
end


