class AddCategoryIdToPlugin < ActiveRecord::Migration
  def self.up
    add_column :plugins, :category_id, :integer
  end

  def self.down
    remove_column :plugins, :category_id
  end
end
