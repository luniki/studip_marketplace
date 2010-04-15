require 'spec_helper'

describe "/plugins/index.html.erb" do
  include PluginsHelper

  before(:each) do
    assigns[:plugins] = plugins = Array.new(2) { Factory :plugin }
    plugins.stub!(:total_pages).and_return(1)
  end

  it "renders a list of plugins" do
    render
    pending
  end
end
