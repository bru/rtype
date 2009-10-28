class Blog < ActiveRecord::Base
  include MovableType
  
  has_many :entries, :foreign_key => 'entry_blog_id'
  
  def basename
    blog_site_url.match(/([^\/]+)\/?$/)[0]
  end
  
  def path
    blog_site_url.sub(/^(http:\/\/){0,1}[^\/]*\//, "")
  end
  
  def url
    blog_site_url
  end
  
  def self.find_by_basename(basename)
    find(:first, :conditions => ["blog_site_url LIKE ? or blog_site_url LIKE ?", "%/#{basename}", "%/#{basename}/"])
  end
end
