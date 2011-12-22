Challenge::Application.routes.draw do
  
  match '/api/get_user_challenges', :to => 'api#get_user_challenges', :conditions => {:method => :get}
  match '/api/get_challenge_list', :to => 'api#get_challenge_list', :condition => {:method => :get}
  match '/api/get_challenge_list_xml', :to => 'api#get_challenge_list', :condition => {:method => :get}
  match '/api/get_user_challenges_xml', :to => 'api#get_user_challenges', :conditions => {:method => :get}
  
  get "location_challenges/new"

  get "location_challenges/show"

  get "location_challenges/edit"

  get "location_challenges/delete"

  resources :authentications
  resources :location_challenges
  match '/auth/:provider/callback' => 'authentications#create'
  devise_for :users

  get "mobile/login"

  #match '/' => 'users#index'
  resource :account, :controller => "users"
  resources :users
  
  match '/users/show' => 'mobile#loglocation'
  
  match '/mobile/loglocation' => "mobile#loglocation"
  # root :controller => "user_sessions", :action => "new"
  
  root :to => 'mobile#index'
  

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
