Rails.application.routes.draw do
  root 'home#top'
  get 'home/top'
  get 'home/about'
  get 'home/thanks'
  get 'admin/home/top'
  devise_for :users
  devise_for :admins
  get 'users/withdrawal', to: 'users#withdrawal'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users,  only: [:edit, :show, :update] do
    resources :orders, only: [:index, :show, :new, :create]
    resources :order_items, only: [:create]
    resources :cart_items, only: [:index, :create, :update, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end
    resources :posts
  end

      namespace :admin do
        resources :users, only: [:index, :show, :edit, :update] do
          resources :orders, only: [:show, :update]
          resources :order_items, only: [:update]
        end
      end

  resources :items, only: [:index, :show]
    namespace :admin do
      resources :items, only: [:index, :show, :new, :create, :edit, :update]
    end
  namespace :admin do
    resources :orders, only: [:index]
    resources :genres, only: [:index, :create, :edit, :update]
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end


