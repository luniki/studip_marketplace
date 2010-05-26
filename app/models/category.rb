class Category < ActiveRecord::Base
  has_many :plugins

  attr_accessible :name
end
