require 'spec_helper'

describe "/releases/show.html.erb" do
  include ReleasesHelper
  before(:each) do
    assigns[:release] = @release = Factory(:release, :plugin => Factory(:plugin))
  end

  it "renders attributes in <p>" do
    pending
#    render
  end
end
