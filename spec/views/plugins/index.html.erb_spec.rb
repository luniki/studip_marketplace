require 'spec_helper'

describe "/plugins/index.html.erb" do
  include PluginsHelper

  before(:each) do
    assigns[:plugins] = [
      stub_model(Plugin,
        :user_id => 1,
        :name => "value for name",
        :description => "value for description",
        :homepage => "value for homepage"
      ),
      stub_model(Plugin,
        :user_id => 1,
        :name => "value for name",
        :description => "value for description",
        :homepage => "value for homepage"
      )
    ]
  end

  it "renders a list of plugins" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
    response.should have_tag("tr>td", "value for homepage".to_s, 2)
  end
end
