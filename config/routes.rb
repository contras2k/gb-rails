Rails.application.routes.draw do
  resources :posts
  get 'posts/page/(:page(.:format))', to: 'posts#index'
#  resources :posts, except: [:destroy]
  get 'home/index'
  get 'index', to: 'home#index'
  root 'home#index'
  get 'home/about'
  get 'about', to: 'home#about'
  get 'home(/:hello)', to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
