class EntriesController < ApplicationController
  
  before_filter :find_blog, :except => [ :home ]
  before_filter :store_location
  
  def home
  end
  
  # this is blog index
  def index
    @entries = Entry.published.paginate(:page => params[:page], :include => [ :author, :blog, :comments, :tags, :categories ], :conditions => { :entry_blog_id => @blog.id }, :order => "entry_authored_on DESC", :per_page => 10)
  end
  
  def search
    @search = Ultrasphinx::Search.new(:query => params[:query])
    @search.excerpt
    @entries = @search.results.paginate(:page => params[:page], :per_page => '10')
    # @count = @search.results.size
    # session[:query] = params[:query] if params[:query]
    # @query = session[:query]
    # @tags = unique_tags(@items, 100)
  end
    
  def tag_search
    @tag = Tag.find(:first, :conditions => { :tag_name => params[:id]})
    @entries = @tag.entries.published[0..24]
  end
  
  
  def category_archive
    @category = Category.find(:first, :conditions => { :category_basename => params[:category] })
    @entries = @category.entries.published[0..24]
  end
  
  def entry_archive
    @entry = Entry.published.find(:first, :conditions => ["entry_blog_id = ? and entry_basename = ? and year(entry_authored_on) = ? and month(entry_authored_on) = ?", @blog.id, params[:basename], params[:year], params[:month] ] )
  end

  
  def monthly_archive
    @entries = Entry.published.find(:all, 
          :conditions => ["entry_blog_id = ? and year(entry_authored_on) = ? and month(entry_authored_on) = ?", 
                          @blog.id, params[:year], params[:month] ], 
          :order => 'entry_authored_on DESC', :limit => 25 )
  end
protected

  def find_blog
    if params[:blog]
      @blog = Blog.find(params[:blog])
    else
      # something bad happened
      logger.error("Can't find blog #{params[:blog]}")
    end
  end
  
end
