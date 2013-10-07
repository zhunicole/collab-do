Collab::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'public#index'

  devise_for :users, :path => "users", :path_names => { 
    :sign_in => 'login', :sign_out => 'logout', :password => 'secret', 
    :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', 
    :sign_up => 'sign_up' }



  # SESSIONS
  # resources :sessions, only: [:new, :create, :destroy]
  # get '/signin' => 'sessions#new'
  # #post '/sessions' => 'sessions#create'   redundant
  # get '/signout' => 'sessions#destroy'
  
  # PROJECTS
  resources :projects, only: [:new, :create, :destroy]
  get '/projects/:id', to: 'projects#show'
  get '/projects/edit/:id', to: 'projects#edit', as: 'edit_project'
  patch '/projects/:id', to: 'projects#update' 
  delete '/projects', to: 'projects#destroy'


  # get /users/new (new)  /users/edit (edit) /users  (index)  /users/1  (show)
  # post /users  (create) 
  # put /users  (update)
  # delete  /users (destroy)


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
