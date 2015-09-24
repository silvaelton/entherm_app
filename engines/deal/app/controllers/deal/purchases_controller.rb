require_dependency 'deal/application_controller'
module Deal
  class PurchasesController < ApplicationController
    def index
    end

    def fpa
      render layout: 'blank_print'
    end
  end
end