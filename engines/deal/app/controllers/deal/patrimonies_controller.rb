require_dependency "deal/application_controller"

module Deal
  class PatrimoniesController < ApplicationController
    before_action :set_patrimony, only: [:show, :edit, :update, :destroy]

    # GET /patrimonies
    def index
      if params[:search].present?
        @patrimonies = Patrimony.search(params[:search])
      else
        @patrimonies = Patrimony.all
      end
    end

    # GET /patrimonies/1
    def show
    end

    # GET /patrimonies/new
    def new
      @patrimony = Patrimony.new
    end

    # GET /patrimonies/1/edit
    def edit
    end

    # POST /patrimonies
    def create
      @patrimony = Patrimony.new(patrimony_params)

      if @patrimony.save
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render :new
      end
    end

    # PATCH/PUT /patrimonies/1
    def update
      if @patrimony.update(patrimony_params)
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render :edit
      end
    end

    # DELETE /patrimonies/1
    def destroy
      if @patrimony.destroy
        flash[:success] = t :success
        redirect_to action: 'index'
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_patrimony
        @patrimony = Patrimony.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def patrimony_params
        params.require(:patrimony).permit(:contract_id, :title, :description, :location, :image_path, :state, :original_value, :estimated_value)
      end
  end
end
