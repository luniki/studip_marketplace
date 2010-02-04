require 'spec_helper'

describe Plugin do
  before(:each) do
    @valid_attributes = {
      :user_id => 1,
      :name => "value for name",
      :description => "value for description",
      :homepage => "value for homepage"
    }
  end

  it "should create a new instance given valid attributes" do
    Plugin.create!(@valid_attributes)
  end
end
