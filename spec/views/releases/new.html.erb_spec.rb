require 'spec_helper'

describe "/releases/new.html.erb" do
  include ReleasesHelper

  before(:each) do
    assigns[:plugin] = @plugin = Factory(:plugin)
    assigns[:release] = Factory.build(:release, :plugin => @plugin)
  end

  it "renders new release form" do
    render

    response.should have_tag("form[action=?][method=post]", plugin_releases_path(@plugin)) do
      with_tag("input#release_package[name=?]", "release[package]")
    end
  end
end
