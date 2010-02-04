class User < ActiveRecord::Base
  include Clearance::User
  has_many :plugins

  def role_symbols
    [:author]
  end
end
