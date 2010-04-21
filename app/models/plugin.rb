class Plugin < ActiveRecord::Base

  belongs_to :user # TODO should be called owner instead
  has_many :releases, :order => "created_at DESC"
  has_one :last_release, :class_name => "Release", :order => "created_at DESC"

  has_attached_file :screenshot,
                    :styles => {
                      :thumb => ["200x150>", :png],
                      :large => ["800x600>", :png]
                    },
                    :url  => "/paperclip/:attachment/:id_:style.:extension",
                    :path => ":rails_root/public/paperclip/:attachment/:id_:style.:extension"

  attr_accessible :name, :description, :homepage, :screenshot
  attr_readonly :name

  validates_uniqueness_of :name
  validates_format_of :name, :with => /[a-zA-Z_\x7f-\xff][a-zA-Z0-9_\x7f-\xff]*/

  define_index do
    indexes :name, :description
    set_property :delta => true
  end

  # TODO (mlunzena) how can I make sure, that a plugin belongs to a user?
  def self.from_zip zip
    plugin = Plugin.new
    release = Release.create :package => zip
    if release.valid?
      plugin.releases << release
      plugin.name = release.manifest.pluginclassname
      plugin.save
    else
      release.errors.each do |attribute, message|
        attribute = "releases_#{attribute}"
        plugin.errors.add(attribute, message) unless plugin.errors.on(attribute)
      end
      logger.debug plugin.errors.to_yaml
    end
    plugin
  end
end
