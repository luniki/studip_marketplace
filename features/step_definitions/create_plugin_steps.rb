Given /^I am not logged in$/ do
  # nothing to do i guess
end

Given /^I am logged in as a developer$/ do
  user = Factory :developer
  Given %{I sign in as "#{user.email}/#{user.password}"}
end


Then /^I should get an error message$/ do
  response.should have_tag "#flash_error"
end

Then /^I should see that a plugin named (.*) exists$/ do |name|
  pending
end

Then /^I should see an error message$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I create a new plugin named (.*)$/ do |name|
  When %{I go to the new plugin page}

  attach_file "plugin_release_package",
              "#{Rails.root}/spec/fixtures/#{name}.zip",
              "application/zip"

#  fill_in "plugin_release_package", :with => "#{Rails.root}/spec/fixtures/#{name}.zip"

  And %{I press "Create"}
end

When /^I create a new plugin with an invalid zip file$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I create a new plugin with a zip file with an invalided manifest$/ do
end

