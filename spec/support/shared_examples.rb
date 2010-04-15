shared_examples_for "a controller without flash errors" do
  after :each do
    response.session[:flash].should_not include(:error) if response.session[:flash]
  end
end

shared_examples_for "a controller accessed authorized" do
    before :each do
      @current_user = Factory(:developer)
      controller.stub!(:current_user).and_return(@current_user)
    end
end

