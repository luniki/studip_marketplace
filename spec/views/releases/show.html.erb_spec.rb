require 'spec_helper'

describe "/releases/show.html.erb" do
  include ReleasesHelper
  before(:each) do
    assigns[:release] = @release = stub_model(Release,
      :plugin_id => 1,
      :version => 1,
      :min => "value for min",
      :max => "value for max"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ min/)
    response.should have_text(/value\ for\ max/)
  end
end
