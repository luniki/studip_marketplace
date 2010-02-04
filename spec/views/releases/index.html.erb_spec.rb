require 'spec_helper'

describe "/releases/index.html.erb" do
  include ReleasesHelper

  before(:each) do
    assigns[:releases] = [
      stub_model(Release,
        :plugin_id => 1,
        :version => 1,
        :min => "value for min",
        :max => "value for max"
      ),
      stub_model(Release,
        :plugin_id => 1,
        :version => 1,
        :min => "value for min",
        :max => "value for max"
      )
    ]
  end

  it "renders a list of releases" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for min".to_s, 2)
    response.should have_tag("tr>td", "value for max".to_s, 2)
  end
end
