Given /^there are some plugins$/ do
  2.times { Factory.create :plugin }
end

Then /^I should see a list of plugins$/ do
  response.should have_selector("li.plugin")
end

