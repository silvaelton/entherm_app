require_dependency 'application_controller'
require_dependency 'deal/application_helper'

module Deal
  class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    layout 'application'

    include Pundit
  end
end
