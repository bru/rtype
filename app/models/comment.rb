class Comment < ActiveRecord::Base
  include MovableType
  
  validates_presence_of :comment_text

  
  # add scope for (un)published comments
  named_scope :visible, :conditions => { :comment_visible => true}
  
  belongs_to :blog, :foreign_key => "comment_blog_id"
  belongs_to :entry, :foreign_key => "comment_entry_id"
end
