require_dependency 'personal_departament/application_controller'
module PersonalDepartament
  class SectorsController < ApplicationController
    before_action :set_sector, only: [:edit, :update, :destroy]
    def index
      @sectors = Sector.all
    end

    def new
      @sector = Sector.new
    end

    def create
      @sector = Sector.new(set_params)

      if @sector.save
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'new'
      end
    end

    def edit
    end

    def update
      if @sector.update(set_params)
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'edit'
      end
    end

    def destroy
      if @sector.destroy
        flash[:success] = t :success
      else
        flash[:danger] = t :danger
      end
      redirect_to action: 'index'
    end

    private

    def set_params
      params.require(:sector).permit(:contract_id, :title, :description, :status)
    end

    def set_sector
      @sector = Sector.find(params[:id])
    end
  end
end