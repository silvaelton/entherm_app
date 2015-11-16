require_dependency 'personal_departament/application_controller'
module PersonalDepartament
  class SectorsController < ApplicationController
   
    def index
      @sectors = Sector.all
    end

    def new
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end

  end
end