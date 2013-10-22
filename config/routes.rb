Collab::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'public#index'

  get '/about', to: 'public#about', as: 'about'

  devise_for :users, 
    :path => "users",
    :path_names => { 
      :sign_in => 'login',
      :sign_out => 'logout',
      :password => 'secret', 
      :confirmation => 'verification', 
      :unlock => 'unblock', 
      :registration => 'register', 
      :sign_up => 'sign_up' 
    }

  # for user to update profile information
  get '/profiles/:id/edit', to: 'profiles#edit', as: 'edit_profile' 
  patch '/profiles/:id/update', to: 'profiles#update', as: 'update_profile'
  get '/profiles/:id', to: 'profiles#show', as: 'profile'
  get '/home', to: 'profiles#index', as: 'user_home'

  # PROJECTS
  resources :projects
  get 'projects/:id/collab', to: 'projects#collab', as: 'collab_project'  
  get 'projects/:id/quit', to: 'projects#quit', as: 'quit_project'  
  # get '/projects', to: 'projects#index', as: 'projects'
  # PAGE ERRORS
  get "/404", :to => "errors#not_found", as: 'not_found'
  get "/422", :to => "errors#unacceptable", as: 'unacceptable'
  get "/500", :to => "errors#internal_error", as: 'internal_error'


  # ADMIN
  # admin users
  get '/admin', to: 'admin#index', as: 'admin'
  delete '/admin/:id/remove_user', to: 'admin#remove_user', as: 'remove_user'
  patch '/admin/:id', to: 'admin#make_admin', as: 'make_admin'
  get '/admin/:id/toggle_feature_user', to: 'admin#toggle_feature_user', as: 'toggle_feature_user'
  get '/admin/id/approve_user', to: 'admin#approve_user', as: 'approve_user'
  # admin projects
  delete '/admin/:id/remove_project', to: 'admin#remove_project', as: 'remove_project'
  get '/admin/:id/toggle_feature_project', to: 'admin#toggle_feature_project', as: 'toggle_feature_project'
  get '/admin/:id/approve_project', to: 'admin#approve_project', as: 'approve_project'




  # get /users/new (new)  /users/edit (edit) /users  (index)  /users/1  (show)
  # post /users  (create) 
  # patch /users  (update)
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
