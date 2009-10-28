class Blog < ActiveRecord::Base
  include MovableType
  
  has_many :entries, :foreign_key => 'entry_blog_id', :conditions => { :entry_class => "entry" }
  has_many :pages, :class_name => 'Entry', :foreign_key => 'entry_blog_id', :conditions => { :entry_class => "page" }
  has_many :categories
  has_many :comments
  
  def self.tag_methods
    %w(ArchiveUrl id name description language SitePath url )
  end
 
  # Tag Methods 
  def basename
    blog_site_url.match(/([^\/]+)\/?$/)[0]
  end
  
  def path
    blog_site_url.sub(/^(http:\/\/){0,1}[^\/]*\//, "")
  end
  alias_method :site_path, :path
  
  def entry_count
    entries.count
  end
  def category_count
    categories.count
  end
  def comment_count
    comments.count
  end
  #alias_method :ping_count, :pings_count
  
  def url
    blog_site_url
  end
  
  def self.find_by_basename(basename)
    find(:first, :conditions => ["blog_site_url LIKE ? or blog_site_url LIKE ?", "%/#{basename}", "%/#{basename}/"])
  end
end
