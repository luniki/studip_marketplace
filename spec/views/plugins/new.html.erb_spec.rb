require 'spec_helper'

describe "/plugins/new.html.erb" do
  include PluginsHelper

  before(:each) do
    assigns[:plugin] = stub_model(Plugin,
      :new_record? => true,
      :user_id => 1,
      :name => "value for name",
      :description => "value for description",
      :homepage => "value for homepage"
    )
  end

  it "renders new plugin form" do
    render

    response.should have_tag("form[action=?][method=post]", plugins_path) do
      with_tag("input#plugin_user_id[name=?]", "plugin[user_id]")
      with_tag("input#plugin_name[name=?]", "plugin[name]")
      with_tag("textarea#plugin_description[name=?]", "plugin[description]")
      with_tag("textarea#plugin_homepage[name=?]", "plugin[homepage]")
    end
  end
end
