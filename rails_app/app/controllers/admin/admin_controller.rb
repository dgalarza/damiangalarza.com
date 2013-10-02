class Admin::AdminController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin'

  before_filter :require_admin

  def require_admin
    authorize! :manage, :all
  end

end
