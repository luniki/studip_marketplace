require 'spec_helper'

describe Manifest do

  it "should create an empty instance w/o attributes" do
    manifest = Manifest.new
    manifest.pluginclassname.should be_nil
  end

  it "should create a new instance from a string" do
    manifest = Manifest.new "pluginclassname= Name \n"
    manifest.should_not be_nil
    manifest.pluginclassname = "Name"
  end

  it "should create a new instance from a hash" do
    manifest = Manifest.new :pluginclassname => " Name \n"
    manifest.should_not be_nil
    manifest.pluginclassname = "Name"
  end
end
