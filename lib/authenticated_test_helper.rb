module AuthenticatedTestHelper
  # Sets the current author in the session from the author fixtures.
  def login_as(author)
    @request.session[:author_id] = author ? (author.is_a?(Author) ? author.id : authors(author).id) : nil
  end

  def authorize_as(author)
    @request.env["HTTP_AUTHORIZATION"] = author ? ActionController::HttpAuthentication::Basic.encode_credentials(authors(author).login, 'monkey') : nil
  end
  
  # rspec
  def mock_author
    author = mock_model(Author, :id => 1,
      :login  => 'user_name',
      :name   => 'U. Surname',
      :to_xml => "Author-in-XML", :to_json => "Author-in-JSON", 
      :errors => [])
    author
  end  
end
