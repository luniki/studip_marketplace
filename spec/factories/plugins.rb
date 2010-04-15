Factory.sequence :plugin_name do |n|
  "FactoredPlugin#{n}"
end

Factory.define :plugin do |plugin|
  plugin.name { Factory.next :plugin_name }
  plugin.user {|user| user.association(:user)}
  plugin.homepage "http://www.example.com"
end

Factory.define :plugin_w_screenshot, :parent => :plugin do |plugin|
  plugin.screenshot { ActionController::TestUploadedFile.new("#{Rails.root}/spec/fixtures/screenshot.png") }
end
