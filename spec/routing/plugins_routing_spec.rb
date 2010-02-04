require 'spec_helper'

describe PluginsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/plugins" }.should route_to(:controller => "plugins", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/plugins/new" }.should route_to(:controller => "plugins", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/plugins/1" }.should route_to(:controller => "plugins", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/plugins/1/edit" }.should route_to(:controller => "plugins", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/plugins" }.should route_to(:controller => "plugins", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/plugins/1" }.should route_to(:controller => "plugins", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/plugins/1" }.should route_to(:controller => "plugins", :action => "destroy", :id => "1") 
    end
  end
end
