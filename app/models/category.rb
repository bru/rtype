class Category < ActiveRecord::Base
  include MovableType
  #has_many :entries, :through => :placements

  belongs_to :blog, :foreign_key => 'category_blog_id'
  has_and_belongs_to_many :entries, :join_table => "mt_placement", :foreign_key => "placement_category_id", :association_foreign_key => "placement_entry_id"
  
  def archive_url
    "/#{blog.path}/#{basename}"
  end
  
end
