class Release < ActiveRecord::Base
  belongs_to :plugin


  has_attached_file :package,
                    :url  => "/paperclip/:attachment/:id_:style.:extension",
                    :path => ":rails_root/public/paperclip/:attachment/:id_:style.:extension"

  # deny mass update
  attr_accessible :package


end
