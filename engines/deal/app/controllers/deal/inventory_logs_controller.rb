require_dependency "deal/application_controller"

module Deal
  class InventoryLogsController < ApplicationController
    before_action :set_new_inventory, only: [:add_item, :remove_item]
    
    has_scope :by_period, :using => [:date_start,:date_end]
    has_scope :contract
    has_scope :item 
    has_scope :log_type

    def index
      @inventory_logs = apply_scopes(InventoryLog).all.order('created_at DESC')
    end

    def add_item
    end

    def remove_item
    end

    def create
      @inventory_log = InventoryLog.new(set_params_log)
      if @inventory_log.save
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        if @inventory_log.entrada?
          render action: 'add_item'
        else
          render action: 'remove_item'
        end
      end
    end

    def destroy
      @inventory_log = InventoryLog.find(params[:id])
      if @inventory_log.destroy
        flash[:success] =  t :success
        redirect_to action: 'index'
      end
    end

    private


    def set_params_log   
      params.require(:inventory_log).permit(:name,:contract_id,:log_type, :inventory_id, :description, :quantity)
    end

    def set_new_inventory
      @inventory_log = InventoryLog.new
    end
  end
end