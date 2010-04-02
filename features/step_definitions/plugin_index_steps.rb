Given /^there are some plugins$/ do
  2.times { Factory.create :plugin }
end

Then /^I should see a list of plugins$/ do
  response.should have_selector("li.plugin") do |matched|
    matched.count.should >= 2
  end
end

When /^I click on a plugin$/ do
  @plugin = Plugin.find :first
  click_link_within ".plugin", @plugin.name
end

Then /^I should see the plugin's page$/ do
  URI.parse(current_url).path.should == plugin_path(@plugin)
end

Given /^the following plugin exists:$/ do |table|
  table.hashes.each do |hash|
    attributes = {}
    hash.each {|k, v| attributes[k.gsub(' ','').underscore] = v}
    @plugin = Factory.create(:plugin, attributes)
  end
end

When /I search for "(.+)"/ do |query|
  When %{I fill in "q" with "#{query}"}
end

