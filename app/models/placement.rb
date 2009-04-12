class Placement < ActiveRecord::Base
  include MovableType
  
  belongs_to :entry, :foreign_key => 'placement_entry_id'
  belongs_to :category, :foreign_key => 'placement_category_id'
end
