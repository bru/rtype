ActionController::Routing::Routes.draw do |map|
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'authors', :action => 'create'
  map.signup '/signup', :controller => 'authors', :action => 'new'
  map.activate '/activate/:activation_code', 
             :controller => 'authors', 
             :action => 'activate', 
             :activation_code => nil
  map.resource :session
  map.resources :authors, :member => { :suspend => :put, :unsuspend => :put, :purge => :delete }
  # map.resources :comments
  map.resources :tags

  map.search '/search', :controller => 'entries', :action => "search"
  map.tag_search 'tag/:id', :controller => 'entries', :action => "tag_search"
    
  # Blog specific routes
  Blog.each do |blog|  
    map.blog blog.path, :controller => 'entries', :blog => blog.id                      
    map.monthly_archive blog.path + '/:year/:month', 
                      :controller => 'entries', :action => 'monthly_archive',
                      :year       => /\d{4}/,
                      :month      => /\d{1,2}/,
                      :blog       => blog.id                  
    map.category_archive blog.path + '/:category',
                      :controller => 'entries', :action => 'category_archive', :blog => blog.id 
    map.entry_archive blog.path + '/:year/:month/:basename',
                      :controller => 'entries', :action => 'entry_archive',
                      :year       => /\d{4}/,
                      :month      => /\d{1,2}/,
                      :blog       => blog.id 
  end 
                    

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  # map.connect ':controller/:action/:id'
  # map.connect ':controller/:action/:id.:format'
end
