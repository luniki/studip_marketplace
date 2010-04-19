Given /^I am the owner of a plugin$/ do
  @plugin = Factory(:plugin, :user => controller.current_user)
end

When /^I add a release of another plugin$/ do
  When %{I go to the new release page}

  manifest = Manifest.new(
      :pluginclassname => "NotTheNameOf#{@plugin.name}",
      :pluginname => "a plugin name",
      :origin => "luniki",
      :version => Factory.next(:release_version)
  )

  attach_file "release_package",
              manifest.to_zip.name,
              "application/zip"
  And %{I press "Create"}
end

