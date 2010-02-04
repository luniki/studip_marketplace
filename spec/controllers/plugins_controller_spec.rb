require 'spec_helper'

describe PluginsController do

  def mock_plugin(stubs={})
    @mock_plugin ||= mock_model(Plugin, stubs)
  end

  describe "GET index" do
    it "assigns all plugins as @plugins" do
      Plugin.stub!(:find).with(:all).and_return([mock_plugin])
      get :index
      assigns[:plugins].should == [mock_plugin]
    end
  end

  describe "GET show" do
    it "assigns the requested plugin as @plugin" do
      Plugin.stub!(:find).with("37").and_return(mock_plugin)
      get :show, :id => "37"
      assigns[:plugin].should equal(mock_plugin)
    end
  end

  describe "GET new" do
    it "assigns a new plugin as @plugin" do
      Plugin.stub!(:new).and_return(mock_plugin)
      get :new
      assigns[:plugin].should equal(mock_plugin)
    end
  end

  describe "GET edit" do
    it "assigns the requested plugin as @plugin" do
      Plugin.stub!(:find).with("37").and_return(mock_plugin)
      get :edit, :id => "37"
      assigns[:plugin].should equal(mock_plugin)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created plugin as @plugin" do
        Plugin.stub!(:new).with({'these' => 'params'}).and_return(mock_plugin(:save => true))
        post :create, :plugin => {:these => 'params'}
        assigns[:plugin].should equal(mock_plugin)
      end

      it "redirects to the created plugin" do
        Plugin.stub!(:new).and_return(mock_plugin(:save => true))
        post :create, :plugin => {}
        response.should redirect_to(plugin_url(mock_plugin))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved plugin as @plugin" do
        Plugin.stub!(:new).with({'these' => 'params'}).and_return(mock_plugin(:save => false))
        post :create, :plugin => {:these => 'params'}
        assigns[:plugin].should equal(mock_plugin)
      end

      it "re-renders the 'new' template" do
        Plugin.stub!(:new).and_return(mock_plugin(:save => false))
        post :create, :plugin => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested plugin" do
        Plugin.should_receive(:find).with("37").and_return(mock_plugin)
        mock_plugin.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :plugin => {:these => 'params'}
      end

      it "assigns the requested plugin as @plugin" do
        Plugin.stub!(:find).and_return(mock_plugin(:update_attributes => true))
        put :update, :id => "1"
        assigns[:plugin].should equal(mock_plugin)
      end

      it "redirects to the plugin" do
        Plugin.stub!(:find).and_return(mock_plugin(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(plugin_url(mock_plugin))
      end
    end

    describe "with invalid params" do
      it "updates the requested plugin" do
        Plugin.should_receive(:find).with("37").and_return(mock_plugin)
        mock_plugin.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :plugin => {:these => 'params'}
      end

      it "assigns the plugin as @plugin" do
        Plugin.stub!(:find).and_return(mock_plugin(:update_attributes => false))
        put :update, :id => "1"
        assigns[:plugin].should equal(mock_plugin)
      end

      it "re-renders the 'edit' template" do
        Plugin.stub!(:find).and_return(mock_plugin(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested plugin" do
      Plugin.should_receive(:find).with("37").and_return(mock_plugin)
      mock_plugin.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the plugins list" do
      Plugin.stub!(:find).and_return(mock_plugin(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(plugins_url)
    end
  end

end
