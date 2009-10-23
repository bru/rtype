class CreateFileinfos < ActiveRecord::Migration
  def self.up
    create_table :fileinfos do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :fileinfos
  end
end
