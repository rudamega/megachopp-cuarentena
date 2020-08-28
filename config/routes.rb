Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :pages
  resources :items
  resources :carts do
    resources :cart_items, only: [:index, :new, :create]
    get 'cart_confirmado', to: 'carts#cart_confirmado'
    get 'cart_vaciar', to: 'carts#cart_vaciar'
  end
    get 'cart_mostrar', to: 'carts#mostrar'
  resources :cart_items, only: [:destroy, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
