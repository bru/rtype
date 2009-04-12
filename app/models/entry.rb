class Entry < ActiveRecord::Base
  include MovableType  
  
  belongs_to :blog, :foreign_key => "entry_blog_id"
  belongs_to :author, :foreign_key => "entry_author_id"
  #has_many :categories, :through => :placements
  has_and_belongs_to_many :categories, :join_table => "mt_placement", :foreign_key => "placement_entry_id", :association_foreign_key => "placement_category_id"
  has_and_belongs_to_many :tags, :join_table => "mt_objecttag", :foreign_key => "objecttag_object_id", :association_foreign_key => "objecttag_tag_id"
  has_many :comments, :foreign_key => "comment_entry_id"
  has_many :trackbacks, :foreign_key => "trackback_entry_id"
  
  
  # add scope for published entries
  named_scope :published, :conditions => { :entry_status => 2 }
  named_scope :draft, :conditions => { :entry_status => 1 }
  
  is_indexed :fields => ['entry_title', 'entry_text', 'entry_text_more']
  
  def permalink
    "#{self.blog.blog_site_url}/#{self.authored_on.year}/#{self.authored_on.month}/#{self.basename}"
  end
end
