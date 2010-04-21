class AddDeltaIndexFlagToPlugins < ActiveRecord::Migration
  def self.up
    add_column :plugins, :delta, :boolean, :default => false
    add_index :plugins, :delta
  end

  def self.down
    remove_column :plugins, :delta
  end
end
