require 'spec_helper'

describe ReleasesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/plugins/6/releases" }.should route_to(:controller => "releases", :action => "index", :plugin_id => "6")
    end

    it "recognizes and generates #new" do
      { :get => "/plugins/6/releases/new" }.should route_to(:controller => "releases", :action => "new", :plugin_id => "6")
    end

    it "recognizes and generates #show" do
      { :get => "/releases/1" }.should route_to(:controller => "releases", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/releases/1/edit" }.should route_to(:controller => "releases", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/plugins/6/releases" }.should route_to(:controller => "releases", :action => "create", :plugin_id => "6")
    end

    it "recognizes and generates #update" do
      { :put => "/releases/1" }.should route_to(:controller => "releases", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/releases/1" }.should route_to(:controller => "releases", :action => "destroy", :id => "1")
    end
  end
end
