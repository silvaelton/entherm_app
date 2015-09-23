require_dependency "deal/application_controller"

module Deal
  class SupplierCategoriesController < ApplicationController
    before_action :set_supplier_category, only: [:show, :edit, :update, :destroy]

    # GET /supplier_categories
    def index
      @supplier_categories = SupplierCategory.all
    end

    # GET /supplier_categories/1
    def show
    end

    # GET /supplier_categories/new
    def new
      @supplier_category = SupplierCategory.new
    end

    # GET /supplier_categories/1/edit
    def edit
    end

    # POST /supplier_categories
    def create
      @supplier_category = SupplierCategory.new(supplier_category_params)

      if @supplier_category.save
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render :new
      end
    end

    # PATCH/PUT /supplier_categories/1
    def update
      if @supplier_category.update(supplier_category_params)
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render :edit
      end
    end

    # DELETE /supplier_categories/1
    def destroy
      if @supplier_category.destroy
        flash[:success] = t :success
        redirect_to action: 'index'
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_supplier_category
        @supplier_category = SupplierCategory.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def supplier_category_params
        params.require(:supplier_category).permit(:title, :status)
      end
  end
end
