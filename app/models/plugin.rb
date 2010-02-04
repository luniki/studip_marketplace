class Plugin < ActiveRecord::Base
  belongs_to :user
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
end
