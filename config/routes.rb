Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :pages
  resources :items
  get 'cart_mostrar/:id', to: 'carts#mostrar', as: :mostrar

  resources :clientes do
    resources :ubicacions
  end

  resources :carts do
    resources :cart_items, only: [:index, :new, :create]
    get 'cart_confirmado', to: 'carts#cart_confirmado'
    get 'cart_vaciar', to: 'carts#cart_vaciar'
    get 'cart_consi/:id', to: 'cart_items#cart_consi', as: :consig
    get 'cart_add/:id', to: 'cart_items#cart_add', as: :add
  end
    get 'cart_mostrar', to: 'carts#mostrar'
    get 'cart_mapa', to: 'carts#mapa'
  resources :cart_items, only: [:destroy, :edit, :update]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [ :index, :show ]
      resources :clientes, only: [ :index, :show ]
      resources :ubicacions, only: [ :index, :show ]
      resources :carts, only: [ :index, :confirmado, :entregado]
      get 'cart_confirmado', to: 'carts#confirmado'
      get 'cart_entregado', to: 'carts#entregado'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
