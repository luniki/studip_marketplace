require 'spec_helper'

describe "/releases/new.html.erb" do
  include ReleasesHelper

  before(:each) do
    assigns[:release] = stub_model(Release,
      :new_record? => true,
      :plugin_id => 1,
      :version => 1,
      :min => "value for min",
      :max => "value for max"
    )
  end

  it "renders new release form" do
    render

    response.should have_tag("form[action=?][method=post]", releases_path) do
      with_tag("input#release_plugin_id[name=?]", "release[plugin_id]")
      with_tag("input#release_version[name=?]", "release[version]")
      with_tag("input#release_min[name=?]", "release[min]")
      with_tag("input#release_max[name=?]", "release[max]")
    end
  end
end
