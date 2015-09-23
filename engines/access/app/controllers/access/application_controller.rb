require_dependency 'application_controller'
module Access
  class ApplicationController < ActionController::Base
    before_action :authenticate_user!
  	layout 'application'
  end
end
