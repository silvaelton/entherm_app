require_dependency 'information/application_controller'
module Information
  class AddressesController < ApplicationController
    
    def cities
      if params[:state_id].present?
        @state = State.find(params[:state_id])
        render json: @state.cities
      else
        render json: "not found" 
      end
    end
  end
end