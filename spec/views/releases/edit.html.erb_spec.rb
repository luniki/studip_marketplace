require 'spec_helper'

describe "/releases/edit.html.erb" do
  include ReleasesHelper

  before(:each) do
    assigns[:release] = @release = stub_model(Release,
      :new_record? => false,
      :plugin_id => 1,
      :version => 1,
      :min => "value for min",
      :max => "value for max"
    )
  end

  it "renders the edit release form" do
    render

    response.should have_tag("form[action=#{release_path(@release)}][method=post]") do
      with_tag('input#release_plugin_id[name=?]', "release[plugin_id]")
      with_tag('input#release_version[name=?]', "release[version]")
      with_tag('input#release_min[name=?]', "release[min]")
      with_tag('input#release_max[name=?]', "release[max]")
    end
  end
end
