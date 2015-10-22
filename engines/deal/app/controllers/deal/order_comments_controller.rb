require_dependency 'deal/application_controller'

module Deal
  class OrderCommentsController < ApplicationController 
    
    def new
      @comment = OrderComment.new
    end

    def create
    end
    
  end
end