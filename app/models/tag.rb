class Tag < ActiveRecord::Base
  include MovableType
  
  has_and_belongs_to_many :entries, :join_table => "mt_objecttag", :foreign_key => "objecttag_tag_id", :association_foreign_key => "objecttag_object_id"
end
