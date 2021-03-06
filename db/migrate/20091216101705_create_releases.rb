class CreateReleases < ActiveRecord::Migration
  def self.up
    create_table :releases do |t|
      t.integer :plugin_id
      t.string :version
      t.string :studipMinVersion
      t.string :studipMaxVersion

      t.timestamps
    end
  end

  def self.down
    drop_table :releases
  end
end
