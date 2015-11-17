require_dependency 'personal_departament/application_controller'
module PersonalDepartament
  class JobsController < ApplicationController
    before_action :set_job, only: [:edit, :update, :destroy]
  
    def index
      @jobs = Job.all
    end

    def new
      @job = Job.new
    end

    def create
      @job = Job.new(set_params)
      
      if @job.save
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'new'
      end
    end

    def edit      
    end

    def update
      if @job.update(set_params)
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'new'
      end    
    end

    def destroy
      if @job.destroy
        flash[:success] = t :success
      else
        flash[:danger] = t :danger
      end
    end

    private

    def set_params
      params.require(:job).permit(:name)
    end

    def set_job
      @job = Job.find(params[:id])
    end


  end
end