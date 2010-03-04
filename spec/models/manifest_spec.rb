require 'spec_helper'

describe Manifest do
  before(:each) do
    @valid_attributes = {

    }
  end

  it "should create a new instance given valid attributes" do
    manifest = Manifest.new ""
    manifest.should_not be_nil
  end
end
