Rails.application.routes.draw do

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}

  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}

   delete '/cart_items/destroy_all', to: 'public/cart_items#destroy_all'

  scope module: :public do
    get '/homes/about', to: 'homes#about'
    resources :items
    get '/customers/check', to: 'customers#check'
    patch '/customers/check', to: 'customers#withdraw'
    resources :customers
    resources :addresses
    resources :cart_items
    get '/orders/complete', to: 'orders#complete'
    resources :orders
    post '/orders/confirm', to: 'orders#confirm'
  end

  namespace :admin do
    resources :homes
    resources :genres
    resources :items
    resources :customers
    resources :orders
  end

  root to: 'public/homes#top'

end
