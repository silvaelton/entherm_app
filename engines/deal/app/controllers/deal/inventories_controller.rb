require_dependency "deal/application_controller"

module Deal
  class InventoriesController < ApplicationController
    before_action :set_inventory, only: [:show, :edit, :update, :destroy]
    before_action :set_inventory_id, only: [:in, :out]

    # GET /inventories
    def index
        @inventories = Inventory.all
    end

    # GET /inventories/1
    def show
    end

    def add_item_new
    end

    def add_item_create
    end

    def remove_item_new
    end

    def remove_item_create
    end
    
    # GET /inventories/new
    def new
      @inventory = Inventory.new
    end

    # GET /inventories/1/edit
    def edit
    end

    # POST /inventories
    def create
      @inventory = Inventory.new(inventory_params)

      if @inventory.save
        flash[:success] =  t :success
        redirect_to action: 'index'
      else
        render :new
      end
    end

    # PATCH/PUT /inventories/1
    def update
      if @inventory.update(inventory_params)
        flash[:success] =  t :success
        redirect_to action: 'index'
      else
        render :edit
      end
    end

    # DELETE /inventories/1
    def destroy
      if @inventory.destroy
        flash[:success] =  t :success
        redirect_to action: 'index'
      end
    end

    def in
    end

    def out
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_inventory
        @inventory = Inventory.find(params[:id])
      end

      def set_inventory_id
        @inventory = Inventory.find(params[:inventory_id])
      end

      # Only allow a trusted parameter "white list" through.
      def inventory_params
        params.require(:inventory).permit( :product_title, :quantity, :observation, :location, :image_path)
      end
  end
end
