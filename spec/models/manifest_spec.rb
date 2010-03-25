require 'spec_helper'

describe Manifest do

  it "should create an empty instance w/o attributes" do
    manifest = Manifest.new
    manifest.pluginclassname.should be_nil
  end

  it "should create a new instance given valid attributes" do
    manifest = Manifest.new ""
    manifest.should_not be_nil
  end
end
