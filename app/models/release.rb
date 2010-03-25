class Release < ActiveRecord::Base

  belongs_to :plugin

  # deny mass update
  attr_accessible :package

  has_attached_file :package,
                    :url  => "/paperclip/:attachment/:id/:style/:filename",
                    :path => ":rails_root/assets/:url",
                    :styles => {
                      :manifest => {
                        :url => "/paperclip/:attachment/:id/:style/plugin.manifest",
                        :path => ":rails_root/assets/:url", # TODO does not work :-(
                        :processors => [:manifest_processor]
                      }
                    }


  validates_attachment_presence :package
  validates_attachment_content_type :package, :content_type => [
                                                 "application/zip",
#                                                 "application/x-zip",
#                                                 "application/x-zip-compressed",
#                                                 "application/octet-stream",
#                                                 "application/x-compress",
#                                                 "application/x-compressed",
#                                                 "multipart/x-zip"
                                              ]
  validates_attachment_size :package, :less_than => 5.megabyte

  VERSION = /\d+\.\d+\.\d+/

  validates_format_of :version, :with => VERSION
  validates_format_of :studipMinVersion, :studipMaxVersion, :with => VERSION, :allow_blank => true

  def manifest
    unless @manifest || new_record? then
      @manifest = Manifest.new File.read(package.path(:manifest))
    end
    @manifest
  end

  def manifest= manifest
    @manifest = manifest
  end

end
