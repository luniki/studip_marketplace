require 'spec_helper'

describe PluginsController do

  describe "GET index" do

    it_should_behave_like "a controller without flash errors"

    it "assigns all plugins as @plugins" do
      plugin = Factory(:plugin)
      Plugin.stub!(:paginate).and_return([plugin])
      get :index
      assigns[:plugins].should == [plugin]
    end
  end

  describe "GET show" do

    it_should_behave_like "a controller without flash errors"

    it "assigns the requested plugin as @plugin" do
      plugin = Factory(:plugin)
      Plugin.should_receive(:find).with("37").and_return(plugin)
      get :show, :id => "37"
      assigns[:plugin].should equal(plugin)
    end
  end

  describe "GET new" do

    it_should_behave_like "a controller without flash errors"
    it_should_behave_like "a controller accessed authorized"

    it "assigns a new plugin as @plugin" do
      plugin = Factory.build :plugin
      Plugin.should_receive(:new).and_return(plugin)
      get :new
      assigns[:plugin].should equal(plugin)
    end
  end

  describe "GET edit" do

    it_should_behave_like "a controller without flash errors"
    it_should_behave_like "a controller accessed authorized"

    it "assigns the requested plugin as @plugin" do
      plugin = Factory(:plugin, :user => @current_user)
      Plugin.stub!(:find).with("37").and_return(plugin)
      get :edit, {:id => "37"}
      assigns[:plugin].should equal(plugin)
    end
  end

  describe "POST create" do

    it_should_behave_like "a controller accessed authorized"

    describe "with valid params" do

      it_should_behave_like "a controller without flash errors"

      before :each do
        @plugin = Factory(:plugin)
      end

      it "assigns a newly created plugin as @plugin" do
        Plugin.should_receive(:from_zip).with('a file').and_return(@plugin)
        post :create, :zip => 'a file'
        assigns[:plugin].should equal(@plugin)
      end

      it "redirects to the created plugin" do
        Plugin.should_receive(:from_zip).with("a file").and_return(@plugin)
        post :create, :zip => "a file"
        response.should redirect_to(plugin_url(@plugin))
      end
    end

    describe "with invalid params" do

      before :each do
        @plugin = Factory.build :plugin
        @plugin.errors.add :base, "error"
        Plugin.stub!(:from_zip).and_return(@plugin)
      end

      it "assigns a newly created but unsaved plugin as @plugin" do
        post :create, :zip => ''
        assigns[:plugin].should equal(@plugin)
      end

      it "re-renders the 'new' template" do
        post :create, :zip => ''
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    it_should_behave_like "a controller accessed authorized"

    before :each do
      @plugin = Factory(:plugin, :user => @current_user)
    end

    describe "with valid params" do

      it_should_behave_like "a controller without flash errors"

      it "updates the requested plugin" do
        Plugin.should_receive(:find).with("37").and_return(@plugin)
        @plugin.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :plugin => {:these => 'params'}
      end

      it "assigns the requested plugin as @plugin" do
        Plugin.stub!(:find).and_return(@plugin)
        put :update, :id => "1"
        assigns[:plugin].should equal(@plugin)
      end

      it "redirects to the plugin" do
        Plugin.stub!(:find).and_return(@plugin)
        put :update, :id => "1"
        response.should redirect_to(plugin_url(@plugin))
      end
    end

    describe "with invalid params" do

      it "updates the requested plugin" do
        Plugin.should_receive(:find).with("37").and_return(@plugin)
        @plugin.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :plugin => {:these => 'params'}
      end

      it "assigns the plugin as @plugin" do
        @plugin.stub!(:update_attributes).and_return(false)
        Plugin.stub!(:find).and_return(@plugin)
        put :update, :id => "1"
        assigns[:plugin].should equal(@plugin)
      end

      it "re-renders the 'edit' template" do
        @plugin.stub!(:update_attributes).and_return(false)
        Plugin.stub!(:find).and_return(@plugin)
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do

    it_should_behave_like "a controller accessed authorized"
    it_should_behave_like "a controller without flash errors"

    before :each do
      @plugin = Factory(:plugin, :user => @current_user)
    end

    it "destroys the requested plugin" do
      Plugin.should_receive(:find).with("37").and_return(@plugin)
      @plugin.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the plugins list" do
      Plugin.stub!(:find).and_return(@plugin)
      delete :destroy, :id => "1"
      response.should redirect_to(plugins_url)
    end
  end

end
