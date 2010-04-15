require 'spec_helper'

describe ReleasesController do

  before :each do
    @plugin = Factory :plugin
    @release = Factory :release, :plugin => @plugin
  end

  describe "GET index" do
    it_should_behave_like "a controller without flash errors"

    it "assigns all releases as @releases" do
      get :index, :plugin_id => @plugin.id
      assigns[:releases].should == [@release]
    end
  end

  describe "GET show" do
    it_should_behave_like "a controller without flash errors"

    it "assigns the requested release as @release" do
      id = @release.id.to_s
      Release.should_receive(:find).with(id).and_return(@release)
      get :show, :id => id
      assigns[:release].should equal(@release)
    end
  end

  describe "GET new" do

    it_should_behave_like "a controller accessed authorized"
    it_should_behave_like "a controller without flash errors"

    before :each do
      @plugin = Factory(:plugin, :user => @current_user)
      @release = Factory.build :release, :plugin => @plugin
    end

    it "assigns a new release as @release" do
      Release.stub!(:new).and_return(@release)
      get :new, :plugin_id => @plugin.id
      assigns[:release].should equal(@release)
    end
  end

  describe "POST create" do

    it_should_behave_like "a controller accessed authorized"

    before :each do
      @plugin = Factory(:plugin, :user => @current_user)
      @release = Factory.create :release, :plugin => @plugin
    end

    describe "with valid params" do

      it_should_behave_like "a controller without flash errors"

      it "assigns a newly created release as @release" do
        Release.should_receive(:new).and_return(@release)
        post :create, :plugin_id => @plugin.id, :release => {:package => 'a file'}
        assigns[:release].should equal(@release)
      end

      it "redirects to the created release" do
        Release.stub!(:new).and_return(@release)
        post :create, :plugin_id => @plugin.id, :release => {}
        response.should redirect_to(release_url(@release))
      end
    end

    describe "with invalid params" do

      before :each do
        @release.stub!(:save).and_return(false)
      end

      it "assigns a newly created but unsaved release as @release" do
        Release.stub!(:new).with({'these' => 'params'}).and_return(@release)
        post :create, :plugin_id => @plugin.id, :release => {:these => 'params'}
        assigns[:release].should equal(@release)
      end

      it "re-renders the 'new' template" do
        Release.stub!(:new).and_return(@release)
        post :create, :plugin_id => @plugin.id, :release => {}
        response.should render_template('new')
      end
    end

  end

  describe "DELETE destroy" do

    it_should_behave_like "a controller accessed authorized"
    it_should_behave_like "a controller without flash errors"

    before :each do
      @plugin = Factory(:plugin, :user => @current_user)
      @release = Factory.create :release, :plugin => @plugin
    end

    it "destroys the requested release" do
      Release.should_receive(:find).with(@plugin.id.to_s).and_return(@release)
      @release.should_receive(:destroy)
      delete :destroy, :id => @plugin.id
    end

    it "redirects to the releases list" do
      @release.stub!(:destroy).and_return(true)
      Release.stub!(:find).and_return(@release)
      delete :destroy, :id => @release.id
      response.should redirect_to(plugin_url(@plugin))
    end
  end

end
