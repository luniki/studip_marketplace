require 'spec_helper'

describe Release do
  before(:each) do
    @valid_attributes = {
      :plugin_id => 1,
      :version => 1,
      :min => "value for min",
      :max => "value for max"
    }
  end

  it "should create a new instance given valid attributes" do
    Release.create!(@valid_attributes)
  end
end
