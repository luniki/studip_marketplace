require 'spec_helper'

describe "/plugins/show.html.erb" do
  include PluginsHelper
  before(:each) do
    assigns[:plugin] = @plugin = stub_model(Plugin,
      :user_id => 1,
      :name => "value for name",
      :description => "value for description",
      :homepage => "value for homepage"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ description/)
    response.should have_text(/value\ for\ homepage/)
  end
end
