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

  # for user to update profile information
  get '/edit_profile', to: 'profiles#edit', as: 'edit_profile' 
  patch '/edit_profile', to: 'profiles#update', as: 'update_profile'

  # PROJECTS
  resources :projects, only: [:new, :create, :destroy]
  get '/projects/:id', to: 'projects#show'
  get '/projects/edit/:id', to: 'projects#edit', as: 'edit_project'
  patch '/projects/:id', to: 'projects#update' 
  delete '/projects', to: 'projects#destroy'




  # PAGE ERRORS

  get "/404", :to => "errors#not_found"
  get "/422", :to => "errors#unacceptable"
  get "/500", :to => "errors#internal_error"

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
