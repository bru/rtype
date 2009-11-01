class ArchivesController < ApplicationController
  
  before_filter :find_fileinfo, :only => [ :show ] 
  before_filter :store_location
  
  def home
  end
  
  # this is blog index

  
  def show
    @t = @fileinfo.template
    if @t.build_type == 6
      # TODO: complete edge cases for monthly and category archives
      @blog = Blog.find(@fileinfo.blog_id)
      case @fileinfo.archive_type.downcase
      when 'index'
        # do nothing
      when 'individual'
        @entry = @fileinfo.entry
      when 'page'
        @page = @fileinfo.entry
      when 'monthly'
        @entries = @blog.entries.find(:all, :conditions => ["entry_published_on > ?", @fileinfo.startdate])
      when 'category'
        # doesn't count secondary categories
        @entries = @blog.entries.find(:all, :conditions => ["entry_category_id = ?", @fileinfo.category_id])
      when 'category-monthly'
        # do something
      end
      render :inline => @t.text
    else
      process_template(@t)
      @performed_render ||= true
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

  
  def find_fileinfo
    url = request.path.sub!(/^(\/?)/,"/")
    @fileinfo = Fileinfo.find_by_url(url)
    render :text => "uh oh - template for " + url + " not found", :status => 404 unless @fileinfo
  end
  
  def process_template(template)
      template.process(request, response)
  end
end