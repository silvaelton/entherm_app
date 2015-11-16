require_dependency 'application_controller'
require_dependency 'application_helper'

module PersonalDepartament
  class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    layout 'application'

    include Pundit

    helper ::ApplicationHelper
  end
end
