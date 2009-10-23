ActionController::Routing::Routes.draw do |map|
  
  # Users and Session Management
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'authors', :action => 'create'
  map.signup '/signup', :controller => 'authors', :action => 'new'
  map.activate '/activate/:activation_code', 
             :controller => 'authors', 
             :action => 'activate', 
             :activation_code => nil
  map.resource :session
  
  # Author Pages
  map.resources :authors, :member => { :suspend => :put, :unsuspend => :put, :purge => :delete }
  
  # Commenting 
  # FIXME: comments probably don't need full REST - this could be just a create...
  map.resources :comments
  
  # Tag search/archives
  # FIXME: tags probably don't need full REST - this could be readonly (index, show)
  map.resources :tags
  map.tag_search 'tag/:id', :controller => 'entries', :action => "tag_search"

  # Search
  map.search '/search', :controller => 'entries', :action => "search"
    
  # By default, show home...
  map.root :controller => 'entries', :action => 'home'

  # Catch all route to resolve all the rest: pages, archives, entries, indexes
  map.connect '*path', :controller => 'entries', :action => 'show'
                    

end
