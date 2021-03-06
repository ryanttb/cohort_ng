class CreateLogItems < ActiveRecord::Migration
  def self.up
    create_table :log_items do |t|
      t.string :log_item_type, :limit => 100, :default => 'update'
      t.string :log_entry, :limit => 4.kilobytes, :null => false
      t.references :contact
      t.timestamps
    end

    [:contact_id,:log_item_type].each do|col|
      add_index :log_items, col
    end

  end

  def self.down
    drop_table :log_items
  end
end
