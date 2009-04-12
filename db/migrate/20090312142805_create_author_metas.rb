class CreateAuthorMetas < ActiveRecord::Migration
  def self.up
    create_table :author_meta do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :author_meta
  end
end
