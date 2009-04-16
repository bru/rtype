require File.dirname(__FILE__) + '/../spec_helper'
  
# Be sure to include AuthenticatedTestHelper in spec/spec_helper.rb instead
# Then, you can remove it from this and the units test.
include AuthenticatedTestHelper

describe AuthorsController do
  fixtures :author

  it 'allows signup' do
    lambda do
      create_author
      response.should be_redirect
    end.should change(Author, :count).by(1)
  end

  


  it 'requires login on signup' do
    lambda do
      create_author(:login => nil)
      assigns[:author].errors.on(:login).should_not be_nil
      response.should be_success
    end.should_not change(Author, :count)
  end
  
  it 'requires password on signup' do
    lambda do
      create_author(:password => nil)
      assigns[:author].errors.on(:password).should_not be_nil
      response.should be_success
    end.should_not change(Author, :count)
  end
  
  it 'requires password confirmation on signup' do
    lambda do
      create_author(:password_confirmation => nil)
      assigns[:author].errors.on(:password_confirmation).should_not be_nil
      response.should be_success
    end.should_not change(Author, :count)
  end

  it 'requires email on signup' do
    lambda do
      create_author(:email => nil)
      assigns[:author].errors.on(:email).should_not be_nil
      response.should be_success
    end.should_not change(Author, :count)
  end
  
  
  
  def create_author(options = {})
    post :create, :author => { :login => 'quire', :email => 'quire@example.com',
      :password => 'quire69', :password_confirmation => 'quire69' }.merge(options)
  end
end

describe AuthorsController do
  describe "route generation" do
    it "should route authors's 'index' action correctly" do
      route_for(:controller => 'authors', :action => 'index').should == "/authors"
    end
    
    it "should route authors's 'new' action correctly" do
      route_for(:controller => 'authors', :action => 'new').should == "/signup"
    end
    
    it "should route {:controller => 'authors', :action => 'create'} correctly" do
      route_for(:controller => 'authors', :action => 'create').should == "/register"
    end
    
    it "should route authors's 'show' action correctly" do
      route_for(:controller => 'authors', :action => 'show', :id => '1').should == "/authors/1"
    end
    
    it "should route authors's 'edit' action correctly" do
      route_for(:controller => 'authors', :action => 'edit', :id => '1').should == "/authors/1/edit"
    end
    
    it "should route authors's 'update' action correctly" do
      route_for(:controller => 'authors', :action => 'update', :id => '1').should == "/authors/1"
    end
    
    it "should route authors's 'destroy' action correctly" do
      route_for(:controller => 'authors', :action => 'destroy', :id => '1').should == "/authors/1"
    end
  end
  
  describe "route recognition" do
    it "should generate params for authors's index action from GET /authors" do
      params_from(:get, '/authors').should == {:controller => 'authors', :action => 'index'}
      params_from(:get, '/authors.xml').should == {:controller => 'authors', :action => 'index', :format => 'xml'}
      params_from(:get, '/authors.json').should == {:controller => 'authors', :action => 'index', :format => 'json'}
    end
    
    it "should generate params for authors's new action from GET /authors" do
      params_from(:get, '/authors/new').should == {:controller => 'authors', :action => 'new'}
      params_from(:get, '/authors/new.xml').should == {:controller => 'authors', :action => 'new', :format => 'xml'}
      params_from(:get, '/authors/new.json').should == {:controller => 'authors', :action => 'new', :format => 'json'}
    end
    
    it "should generate params for authors's create action from POST /authors" do
      params_from(:post, '/authors').should == {:controller => 'authors', :action => 'create'}
      params_from(:post, '/authors.xml').should == {:controller => 'authors', :action => 'create', :format => 'xml'}
      params_from(:post, '/authors.json').should == {:controller => 'authors', :action => 'create', :format => 'json'}
    end
    
    it "should generate params for authors's show action from GET /authors/1" do
      params_from(:get , '/authors/1').should == {:controller => 'authors', :action => 'show', :id => '1'}
      params_from(:get , '/authors/1.xml').should == {:controller => 'authors', :action => 'show', :id => '1', :format => 'xml'}
      params_from(:get , '/authors/1.json').should == {:controller => 'authors', :action => 'show', :id => '1', :format => 'json'}
    end
    
    it "should generate params for authors's edit action from GET /authors/1/edit" do
      params_from(:get , '/authors/1/edit').should == {:controller => 'authors', :action => 'edit', :id => '1'}
    end
    
    it "should generate params {:controller => 'authors', :action => update', :id => '1'} from PUT /authors/1" do
      params_from(:put , '/authors/1').should == {:controller => 'authors', :action => 'update', :id => '1'}
      params_from(:put , '/authors/1.xml').should == {:controller => 'authors', :action => 'update', :id => '1', :format => 'xml'}
      params_from(:put , '/authors/1.json').should == {:controller => 'authors', :action => 'update', :id => '1', :format => 'json'}
    end
    
    it "should generate params for authors's destroy action from DELETE /authors/1" do
      params_from(:delete, '/authors/1').should == {:controller => 'authors', :action => 'destroy', :id => '1'}
      params_from(:delete, '/authors/1.xml').should == {:controller => 'authors', :action => 'destroy', :id => '1', :format => 'xml'}
      params_from(:delete, '/authors/1.json').should == {:controller => 'authors', :action => 'destroy', :id => '1', :format => 'json'}
    end
  end
  
  describe "named routing" do
    before(:each) do
      get :new
    end
    
    it "should route author_path() to /authors" do
      author_path().should == "/authors"
      formatted_author_path(:format => 'xml').should == "/authors.xml"
      formatted_author_path(:format => 'json').should == "/authors.json"
    end
    
    it "should route new_author_path() to /authors/new" do
      new_author_path().should == "/authors/new"
      formatted_new_author_path(:format => 'xml').should == "/authors/new.xml"
      formatted_new_author_path(:format => 'json').should == "/authors/new.json"
    end
    
    it "should route author_(:id => '1') to /authors/1" do
      author_path(:id => '1').should == "/authors/1"
      formatted_author_path(:id => '1', :format => 'xml').should == "/authors/1.xml"
      formatted_author_path(:id => '1', :format => 'json').should == "/authors/1.json"
    end
    
    it "should route edit_author_path(:id => '1') to /authors/1/edit" do
      edit_author_path(:id => '1').should == "/authors/1/edit"
    end
  end
  
end
