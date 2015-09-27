require_dependency "deal/application_controller"

module Deal
  class QuotationsController < ApplicationController
    before_action :set_quotation, only: [:show, :edit, :update, :destroy]

    # GET /quotations
    def index
      if params[:search].present?
        @quotations = Quotation.search(params[:search])
      else
        @quotations = Quotation.all
      end
    end

    # GET /quotations/1
    def show
    end

    # GET /quotations/new
    def new
      @quotation = Quotation.new
    end

    # GET /quotations/1/edit
    def edit
    end

    # POST /quotations
    def create
      @quotation = Quotation.new(quotation_params)

      if @quotation.save
        flash[:success] =  t :succes
        redirect_to action: 'index'
      else
        render :new
      end
    end

    # PATCH/PUT /quotations/1
    def update
      if @quotation.update(quotation_params)
        flash[:success] =  t :succes
        redirect_to action: 'index'
      else
        render :edit
      end
    end

    # DELETE /quotations/1
    def destroy
      if @quotation.destroy
       flash[:success] =  t :succes
       redirect_to action: 'index'
      end
    end



    private
      # Use callbacks to share common setup or constraints between actions.
      def set_quotation
        @quotation = Quotation.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def quotation_params
        params.require(:quotation).permit(:contract_id, :order_id, :description, :status)
      end
  end
end
