require 'spec_helper'

describe Release do
  before(:each) do
    zip = "#{Rails.root}/spec/fixtures/ExamplePlugin.zip"
    @valid_attributes = {
      :package => ActionController::TestUploadedFile.new(zip, "application/zip")
#      :plugin_id => 1,
#      :version => 1,
#      :min => "value for min",
#      :max => "value for max"
    }
  end

  it "should create a new instance given valid attributes" do
    Release.create!(@valid_attributes)
  end

  it "should have a manifest" do
    release = Release.create!(@valid_attributes)
    release.manifest.should_not be_nil
    release.manifest.pluginclassname.should == "ExamplePlugin"
    release.manifest.version.should == "1.0.0"
    release.version.should == "1.0.0"
  end

  describe "without a package" do
    it "should have no manifest" do
      release = Release.new
      release.manifest.should be_nil
    end
  end

  describe "that was already saved" do
    before do
      id = Release.create!(@valid_attributes).id
      @release = Release.find id
      @release.reload
    end

    it "should have a manifest" do
      mock = mock_model(Manifest)
      Manifest.should_receive(:new).and_return(mock)
      @release.manifest.should == mock
    end
  end
end
