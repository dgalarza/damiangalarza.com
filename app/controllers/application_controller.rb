class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  rescue_from CanCan::AccessDenied, :with => :access_denied

  def record_not_found
    render :file => "public/404.html", :status => 404, :layout => false
  end

  def access_denied
    render :text => 'Access Denied', :status => 403, :layout => false
  end

end
