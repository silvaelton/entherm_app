require_dependency 'application_controller'
module Dashboard
  class ApplicationController < ActionController::Base
    before_action :authenticate_user!
 		layout 'application'
  end
end
