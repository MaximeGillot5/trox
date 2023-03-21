Rails.application.routes.draw do
  resources :tools
  get 'about', to: 'static_pages#about'
  get 'contact', to: 'static_pages#contact'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  root "static_pages#home"
end
