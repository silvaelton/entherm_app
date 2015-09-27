require_dependency "deal/application_controller"

module Deal
  class InventoriesController < ApplicationController
    before_action :set_inventory, only: [:show, :edit, :update, :destroy]

    # GET /inventories
    def index
      if params[:search].present?
        @inventories = Inventory.search(params[:search])
      else
        @inventories = Inventory.all
      end
    end

    # GET /inventories/1
    def show
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

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_inventory
        @inventory = Inventory.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def inventory_params
        params.require(:inventory).permit(:contract_id, :product_title, :quantity, :observation, :location, :image_path)
      end
  end
end
