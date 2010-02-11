require 'spec_helper'

describe ReleasesController do

  def mock_release(stubs={})
    @mock_release ||= mock_model(Release, stubs)
  end

  describe "GET index" do
    it "assigns all releases as @releases" do
      Release.stub!(:find).with(:all).and_return([mock_release])
      get :index
      assigns[:releases].should == [mock_release]
    end
  end

  describe "GET show" do
    it "assigns the requested release as @release" do
      Release.stub!(:find).with("37").and_return(mock_release)
      get :show, :id => "37"
      assigns[:release].should equal(mock_release)
    end
  end

  describe "GET new" do
    it "assigns a new release as @release" do
      Release.stub!(:new).and_return(mock_release)
      get :new
      assigns[:release].should equal(mock_release)
    end
  end

  describe "GET edit" do
    it "assigns the requested release as @release" do
      Release.stub!(:find).with("37").and_return(mock_release)
      get :edit, :id => "37"
      assigns[:release].should equal(mock_release)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created release as @release" do
        Release.stub!(:new).with({'these' => 'params'}).and_return(mock_release(:save => true))
        post :create, :release => {:these => 'params'}
        assigns[:release].should equal(mock_release)
      end

      it "redirects to the created release" do
        Release.stub!(:new).and_return(mock_release(:save => true))
        post :create, :release => {}
        response.should redirect_to(release_url(mock_release))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved release as @release" do
        Release.stub!(:new).with({'these' => 'params'}).and_return(mock_release(:save => false))
        post :create, :release => {:these => 'params'}
        assigns[:release].should equal(mock_release)
      end

      it "re-renders the 'new' template" do
        Release.stub!(:new).and_return(mock_release(:save => false))
        post :create, :release => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested release" do
        Release.should_receive(:find).with("37").and_return(mock_release)
        mock_release.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :release => {:these => 'params'}
      end

      it "assigns the requested release as @release" do
        Release.stub!(:find).and_return(mock_release(:update_attributes => true))
        put :update, :id => "1"
        assigns[:release].should equal(mock_release)
      end

      it "redirects to the release" do
        Release.stub!(:find).and_return(mock_release(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(release_url(mock_release))
      end
    end

    describe "with invalid params" do
      it "updates the requested release" do
        Release.should_receive(:find).with("37").and_return(mock_release)
        mock_release.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :release => {:these => 'params'}
      end

      it "assigns the release as @release" do
        Release.stub!(:find).and_return(mock_release(:update_attributes => false))
        put :update, :id => "1"
        assigns[:release].should equal(mock_release)
      end

      it "re-renders the 'edit' template" do
        Release.stub!(:find).and_return(mock_release(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested release" do
      Release.should_receive(:find).with("37").and_return(mock_release)
      mock_release.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the releases list" do
      Release.stub!(:find).and_return(mock_release(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(releases_url)
    end
  end

end
