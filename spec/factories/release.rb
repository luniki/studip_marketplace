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
