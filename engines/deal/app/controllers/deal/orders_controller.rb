require_dependency 'deal/application_controller'

module Deal
  class OrdersController < ApplicationController

    def index
      @orders = current_user.orders
    end

    def new
      @order = Order.new
    end

    def show
      @order = current_user.orders.find(params[:id])
    end

    def create
      @order = Order.new(set_params)
      @order.set_user(current_user)

      if @order.save
        flash[:success] =  t :success
        redirect_to action: 'index'
      else
        render action: 'new'
      end
    end

    private

    def set_params
      params.require(:order).permit(:description, :pdf, :contract_id, order_items_attributes: [:_destroy, :id, :product_title, :image_path, :unit, :goal, :quantity])
    end
  end
end