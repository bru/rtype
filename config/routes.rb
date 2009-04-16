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
  map.resources :comments
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
                    

  map.root :controller => 'entries', :action => 'home'
end
