Given /^I am not logged in$/ do
  # nothing to do i guess
end

Given /^I am logged in as a developer$/ do
  user = Factory :developer
  Given %{I sign in as "#{user.email}/#{user.password}"}
end


Then /^I should see an error message$/ do
  response.should have_tag "#flash_error"
end

Then /^I should see that a plugin named (.*) exists$/ do |name|
  When %{I go to the plugins page}
  response.should contain "ExamplePlugin"
end

When /^I create a new plugin named (.*)$/ do |name|
  When %{I go to the new plugin page}

  attach_file "zip",
              "#{Rails.root}/spec/fixtures/#{name}.zip",
              "application/zip"

  And %{I press "Create"}
end

When /^I create a new plugin with an invalid zip file$/ do
  When %{I create a new plugin named InvalidPlugin}
end

When /^I create a new plugin with a zip file with an invalided manifest$/ do
  When %{I create a new plugin named InvalidManifestPlugin}
end

