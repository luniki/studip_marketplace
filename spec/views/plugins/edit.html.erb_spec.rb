require 'spec_helper'

describe "/plugins/edit.html.erb" do
  include PluginsHelper

  before(:each) do
    assigns[:plugin] = @plugin = Factory(:plugin)
  end

  it "renders the edit plugin form" do
    render

    response.should have_tag("form[action=#{plugin_path(@plugin)}][method=post]") do
      with_tag('input#plugin_name[name=?]', "plugin[name]")
      with_tag('textarea#plugin_description[name=?]', "plugin[description]")
      with_tag('input#plugin_homepage[name=?]', "plugin[homepage]")
    end
  end
end
