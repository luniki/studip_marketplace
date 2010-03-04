class AddAttachmentsPackageToRelease < ActiveRecord::Migration
  def self.up
    add_column :releases, :package_file_name, :string
    add_column :releases, :package_content_type, :string
    add_column :releases, :package_file_size, :integer
    add_column :releases, :package_updated_at, :datetime
  end

  def self.down
    remove_column :releases, :package_file_name
    remove_column :releases, :package_content_type
    remove_column :releases, :package_file_size
    remove_column :releases, :package_updated_at
  end
end
