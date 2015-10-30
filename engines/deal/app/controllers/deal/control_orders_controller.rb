require_dependency 'deal/application_controller'
module Deal
  class ControlOrdersController < ApplicationController
    before_action :set_order, only: [:edit, :update, :destroy]

    def index
      if params[:search]
        @orders = Order.search(params[:search])
      else
        @orders = Order.this_month
      end
    end


    def edit
    end
    
    def update
      if @order.update(set_params)
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'edit'
      end
    end

    def destroy
      if @order.destroy
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'edit'
      end
    end

    def show
      @order = Order.find(params[:id])
    end

    private

    def set_order
      @order = Order.find(params[:id])
    end

    def set_params
      params.require(:order).permit(:status)
    end
  end
end