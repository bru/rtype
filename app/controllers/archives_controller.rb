class ArchivesController < ApplicationController
  
  before_filter :find_blog, :except => [ :home, :search, :tag_search ]
  before_filter :find_archive, :only => [ :show ] 
  before_filter :store_location
  
  def home
  end
  
  # this is blog index

  
  def show
    if @is_index
      index
      render :action => "index"
    elsif @is_entry
      entry_archive
      render :action => "entry_archive"
    elsif @is_monthly
      monthly_archive
      render :action => "monthly_archive"
    else
      category_archive
      render :action => "category_archive"
    end
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
  
  

protected

  def index
    @entries = Entry.published.paginate(:page => params[:page], :include => [ :author, :blog, :comments, :tags, :categories ], :conditions => { :entry_blog_id => @blog.id }, :order => "entry_authored_on DESC", :per_page => 10)
  end
  
  def category_archive
    path = params[:path]
    
    @category = Category.find(:first, :conditions => { :category_basename => path[1] })
    @entries = @category.entries.published[0..24]
  end
  
  def entry_archive
    path = params[:path]
    @entry = Entry.published.find(:first, :conditions => ["entry_blog_id = ? and entry_basename = ? and year(entry_authored_on) = ? and month(entry_authored_on) = ?", @blog.id, path[3], path[1], path[2] ] )
  end

  
  def monthly_archive
    path = params[:path]
    @entries = Entry.published.find(:all, 
          :conditions => ["entry_blog_id = ? and year(entry_authored_on) = ? and month(entry_authored_on) = ?", 
                          @blog.id, path[1], path[2] ], 
          :order => 'entry_authored_on DESC', :limit => 25 )
  end

  def find_blog
    if params[:path]
      @blog = Blog.find_by_basename(params[:path].first)
    else
      # something bad happened
      logger.error("Can't find blog #{params[:blog]}")
    end
  end
  
  def find_archive
    path = params[:path]
    
    if (path.size == 1)
      @is_index = true 
    elsif (path[1] and path[1].match(/\d\d\d\d/) and path[2] and path[2].match(/\d\d?/) ) 
      if (path[3]) 
        @is_entry = true
      else
        @is_monthly = true
      end
    else
      @is_category = true
    end
  end
end