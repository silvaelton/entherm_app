require_dependency 'deal/application_controller'

module Deal
  class OrderCommentsController < ApplicationController 
    before_action :set_order

    def new
      @comment = @order.order_comments.new
    end

    def create
      @comment = @order.order_comments.new(set_params)
      @comment.user_id = current_user.id
      @comment.save
    end
    
    def destroy
      @comment = @order.order_comments.find(params[:id])
      @comment.destroy
    end
    
    private


    def set_order
      @order = Order.find(params[:control_order_id])
    end
    
    def set_params
      params.require(:order_comment).permit(:content)
    end
  end
end