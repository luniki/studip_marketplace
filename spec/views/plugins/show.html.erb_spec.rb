require 'spec_helper'

describe "/plugins/show.html.erb" do
  include PluginsHelper

  before(:each) do
    assigns[:plugin] = @plugin = Factory(:plugin_w_screenshot)
    @release = Factory(:release)
    @plugin.releases << @release
    render
  end

  subject { response }

  it { should have_tag "h2", @plugin.name }
  it { should have_tag ".author", /#{@plugin.user.email}/ }

  it { should have_tag "img.screenshot[src=?]", @plugin.screenshot.url(:thumb) }

  it { should have_tag "a[href=?]", @plugin.homepage }

  it "should have a list of its releases" do
    should have_tag "ul#releases li", :count => 1 do
      with_tag "a[href=?]", @release
    end
  end

#  it "renders name" do
#    render
#    response.should have_tag "h2", @plugin.name
#    response.should have_text(/value\ for\ name/)
#    response.should have_text(/value\ for\ description/)
#    response.should have_text(/value\ for\ homepage/)
#  end
end
