require 'spec_helper'

describe "/releases/index.html.erb" do
  include ReleasesHelper

  before(:each) do
    assigns[:plugin] = plugin = Factory(:plugin)
    assigns[:releases] = Array.new(2) { Factory.create(:release, :plugin => plugin) }
  end

  it "renders a list of releases" do
    # render
    pending
  end
end
