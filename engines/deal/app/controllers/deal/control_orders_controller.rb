module Deal
  class ControlOrdersController < ApplicationController
    
    def index
      if params[:status].present?
        @orders = Order.where(status: params[:status].to_i)
      else
        @orders = Order.where(status: 0)
      end
    end

    def show
      @order = Order.find(params[:id])
    end

  end
end