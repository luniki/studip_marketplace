Factory.sequence :plugin_name do |n|
  "FactoredPlugin#{n}"
end

Factory.define :plugin do |plugin|
  plugin.name { Factory.next :plugin_name }
  plugin.user {|user| user.association(:user)}
end
