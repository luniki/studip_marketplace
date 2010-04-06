require 'paperclip'
module Paperclip::Interpolations
  alias_method :org_attachment, :attachment
  def attachment(att, style)
    "CUKE/" + org_attachment(att, style)
  end
end
After do
  `rm -rf #{"#{RAILS_ROOT}/public/system/CUKE"}`
end
