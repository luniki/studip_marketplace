class ApplicationController < ActionController::Base
  include Clearance::Authentication

  helper :all

  protect_from_forgery

  include HoptoadNotifier::Catcher



  before_filter do |controller|
    Authorization.current_user = controller.current_user
  end

  protected

  def permission_denied
    flash[:error] = "Sorry, you are not allowed to access that page."
    redirect_to root_url
  end
end
