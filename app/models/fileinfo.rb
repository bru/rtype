class Fileinfo < ActiveRecord::Base
  include MovableType
  
  belongs_to :template, :foreign_key => "fileinfo_template_id"
  belongs_to :blog, :foreign_key => "fileinfo_blog_id"
  belongs_to :category, :foreign_key => "fileinfo_category_id"
  belongs_to :author, :foreign_key => "fileinfo_author_id"
  belongs_to :entry, :foreign_key => "fileinfo_entry_id"
end