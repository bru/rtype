class Fileinfo < ActiveRecord::Base
  include MovableType
  
  #belongs_to :template
  belongs_to :blog
  belongs_to :category
  belongs_to :author
end