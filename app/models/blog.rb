class Blog < ActiveRecord::Base
  include MovableType
  
  has_many :entries, :foreign_key => 'entry_blog_id', :conditions => { :entry_class => "entry" }
  has_many :pages, :class_name => 'Entry', :foreign_key => 'entry_blog_id', :conditions => { :entry_class => "page" }
  has_many :categories
  has_many :comments
  
  def self.tag_methods
    %w(ArchiveUrl ID Name Description Language SitePath Url RelativeUrl EntryCount CategoryCount CommentCount Host PageCount)
  end
 
  # Tag Methods 
  def basename
    blog_site_url.match(/([^\/]+)\/?$/)[0]
  end
  
  def path
    blog_site_url.sub(/^(http:\/\/){0,1}[^\/]*\//, "")
  end
  alias_method :site_path, :path
  alias_method :relative_url, :path
  
  def host
    blog_site_url.match(/^(http:\/\/){0,1}([^\/]*)\//)[1]
  end
  
  def entry_count
    entries.count
  end
  def category_count
    categories.count
  end
  def comment_count
    comments.count
  end
  def page_count
    pages.count
  end
  #alias_method :ping_count, :pings_count
  
  def url
    blog_site_url
  end
  
  def self.find_by_basename(basename)
    find(:first, :conditions => ["blog_site_url LIKE ? or blog_site_url LIKE ?", "%/#{basename}", "%/#{basename}/"])
  end
end
