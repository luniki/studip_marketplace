class CreateReleases < ActiveRecord::Migration
  def self.up
    create_table :releases do |t|
      t.integer :plugin_id
      t.integer :version
      t.string :min
      t.string :max

      t.timestamps
    end
  end

  def self.down
    drop_table :releases
  end
end
