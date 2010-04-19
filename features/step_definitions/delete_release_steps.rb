Given /^the plugin has a release$/ do
  @release = Factory(:release_w_plugin, :plugin => @plugin)
end

When /^I delete the release$/ do
  visit release_path(@release), :delete
end

Then /^I should not see an error message$/ do
  response.should_not have_tag "#flash_error"
end

Then /^I should see no releases$/ do
  Then %{I go to the plugin page}
  response.should have_tag "#releases" do |list|
     list.should_not have_tag "li"
  end
end

