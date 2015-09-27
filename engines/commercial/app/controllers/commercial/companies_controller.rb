require_dependency "commercial/application_controller"

module Commercial
  class CompaniesController < ApplicationController
    before_action :set_company, only: [:show, :edit, :update, :destroy]

    # GET /companies
    def index
      @companies = Company.all
    end

    # GET /companies/1
    def show
    end

    # GET /companies/new
    def new
      @company = Company.new
    end

    # GET /companies/1/edit
    def edit
    end

    # POST /companies
    def create
      @company = Company.new(company_params)

      if @company.save
        flash[:success] =  t :success
        redirect_to action: 'index'
      else
        render :new
      end
    end

    # PATCH/PUT /companies/1
    def update
      if @company.update(company_params)
        flash[:success] =  t :success
        redirect_to action: 'index'
      else
        render :edit
      end
    end

    # DELETE /companies/1
    def destroy
      if @company.destroy
        flash[:success] =  t :success
        redirect_to action: 'index'
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_company
        @company = Company.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def company_params
        params.require(:company).permit(:name, :cnpj, :city_id, :state_id, :address, :addres_complement, :cep, :telephone, :telephone_optional)
      end
  end
end
