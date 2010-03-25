require 'spec_helper'

describe Plugin do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :description => "value for description",
      :homepage => "value for homepage"
    }
  end

  it "should create a new instance given valid attributes" do
    Plugin.create!(@valid_attributes)
  end

  it "should require a plugin name" do
    plugin = Plugin.create(@valid_attributes.dup.delete("name"))
    plugin.should_not be_valid
  end

  it "should be creatable from a valid zip" do
    file = "#{Rails.root}/spec/fixtures/ExamplePlugin.zip"
    zip = ActionController::TestUploadedFile.new(file, "application/zip")
    plugin = Plugin.from_zip zip
    plugin.save.should == true
  end

  describe "created from a zip file" do

    before(:each) do
      file = "#{Rails.root}/spec/fixtures/ExamplePlugin.zip"
      zip = ActionController::TestUploadedFile.new(file, "application/zip")
      @plugin = Plugin.from_zip zip
      @plugin.save!
    end

    it "should have a release" do
      @plugin.should have(1).releases
    end

    it "should have the same name as the name from the manifest" do
      @plugin.name.should == "ExamplePlugin"
    end
  end
end
