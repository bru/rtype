class ArchivesController < ApplicationController
  
  before_filter :find_archive, :only => [ :show ] 
  before_filter :store_location
  
  def home
  end
  
  # this is blog index

  
  def show
    @template = @fileinfo.template
    process_template(@template)
    @performed_render ||= true
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

  # def index
  #   @entries = Entry.published.paginate(:page => params[:page], :include => [ :author, :blog, :comments, :tags, :categories ], :conditions => { :entry_blog_id => @blog.id }, :order => "entry_authored_on DESC", :per_page => 10)
  # end
  # 
  # def category_archive  
  #   @category = Category.find(@fileinfo.category_id)
  #   @entries = @category.entries.published[0..24]
  # end
  # 
  # def entry_archive
  #   @entry = Entry.published.find(@fileinfo.entry_id)
  # end
  # 
  # def monthly_archive
  #   path = params[:path]
  #   @month = @fileifo.startdate
  #   @entries = Entry.published.find(:all, 
  #         :conditions => ["entry_blog_id = ? and year(entry_authored_on) = ? and month(entry_authored_on) = ?", 
  #                         @blog.id, path[1], path[2] ], 
  #         :order => 'entry_authored_on DESC', :limit => 25 )
  # end
  
  def find_archive
    url = request.path.sub!(/^(\/?)/,"/")
    @fileinfo = Fileinfo.find_by_url(url)
    if @fileinfo
      @blog = Blog.find(@fileinfo.blog_id)
    else
      render :text => "uh oh", :status => 404
    end
  end
  
  def process_template(template)
    template.process(request, response)
  end
end