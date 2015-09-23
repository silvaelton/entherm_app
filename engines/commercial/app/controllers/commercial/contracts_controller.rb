require_dependency 'commercial/application_controller'
module Commercial
  class ContractsController < ApplicationController
    before_action :set_contract, only: [:show, :edit, :update, :destroy]

    def index
      @contracts = Contract.all
    end

    def new
      @contract = Contract.new
    end

    def create
      @contract = Contract.new(set_params)

      if @contract.save
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'new'
      end
    end

    def show
    end

    def edit
    end

    def update
      if @contract.update(set_params)
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'new'
      end
    end

    def destroy
      if @contract.destroy
        flash[:success]  = t :success
        redirect_to action: 'index'
      end
    end

    private

    def set_params
      params.require(:contract).permit(:title, :status)
    end

    def set_contract
      @contract = Contract.find(params[:id])
    end
  end
end