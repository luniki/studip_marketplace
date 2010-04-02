class Plugin < ActiveRecord::Base

  belongs_to :user # TODO should be called owner instead
  has_many :releases

  has_attached_file :screenshot,
                    :styles => {
                      :thumb => ["200x150>", :png],
                      :large => ["800x600>", :png]
                    },
                    :url  => "/paperclip/:attachment/:id_:style.:extension",
                    :path => ":rails_root/public/paperclip/:attachment/:id_:style.:extension"

  attr_accessible :name, :description, :homepage

  validates_uniqueness_of :name
  validates_format_of :name, :with => /[a-zA-Z_\x7f-\xff][a-zA-Z0-9_\x7f-\xff]*/

  define_index do
    indexes :name, :description
  end

  # TODO (mlunzena) how can I make sure, that a plugin belongs to a user?
  def self.from_zip! zip
    plugin = Plugin.new
    release = Release.create! :package => zip
    plugin.releases << release
    plugin.name = release.manifest.pluginclassname
    plugin.save!
    plugin
  end
end
