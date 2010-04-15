require 'spec_helper'

describe "/plugins/new.html.erb" do
  include PluginsHelper

  before(:each) do
    assigns[:plugin] = Factory.build(:plugin)
  end

  it "renders new plugin form" do
    render

    response.should have_tag("form[action=?][method=post]", plugins_path) do
      with_tag("input#zip[name=?]", "zip")
    end
  end
end
