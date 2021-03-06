Rails.application.routes.draw do

  #SECOND OPTION
  #devise_for :users
  #devise_for :users, controllers: { sessions: "users/sessions" }

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :posts
  resources :friends, only: [:create, :destroy]
  get '/' => 'public#wall'
  get 'public/wall'
  get '/publish' => 'public#publish'
  post '/publish/:id' => 'public#friendPublish'

  #get 'friends/create'
  get '/users/:id' => 'users#show'

  post '/users/:id' => 'friends#create'
  delete '/users/:id' => 'friends#destroy'

  post '/search' => 'users#search'

  delete '/posts/:id/destroy' => 'posts#destroyOwn'

  root to: 'public#wall'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
