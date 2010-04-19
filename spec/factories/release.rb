Factory.sequence :release_version do |n|
  "1.0.#{n}"
end

Factory.define :release do |release|
  release.package do
    manifest = Manifest.new(
      :pluginclassname => "ExamplePlugin",
      :pluginname => "Example",
      :origin => "luniki",
      :version => Factory.next(:release_version)
    )
    ActionController::TestUploadedFile.new(manifest.to_zip.name, "application/zip")
  end
end

Factory.define :release_w_plugin, :class => :release do |release|
  release.plugin {|plugin| plugin.association(:plugin)}
  release.package do |release|
    manifest = Manifest.new(
      :pluginclassname => release.plugin.name,
      :pluginname => "Example",
      :origin => "luniki",
      :version => Factory.next(:release_version)
    )
    ActionController::TestUploadedFile.new(manifest.to_zip.name, "application/zip")
  end
end
