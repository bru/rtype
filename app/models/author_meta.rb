class AuthorMeta < ActiveRecord::Base
  set_table_name 'mt_author_meta'  
  set_primary_keys :author_meta_author_id, :author_meta_type
  belongs_to :author, :foreign_key => 'author_meta_author_id'
  
end
