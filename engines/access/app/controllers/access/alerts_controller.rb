require_dependency 'access/application_controller'

module Access
  class AlertsController < ApplicationController
    before_action :set_alert, only: [:edit, :update, :destroy, :show]
    
    def index
      authorize :privilege, :administrator?
      @alerts = Alert.all.order('created_at DESC')
    end

    def new
      authorize :privilege, :administrator?
      @alert = Alert.new
    end

    def create
      authorize :privilege, :administrator?
      @alert = Alert.new(set_params)
      @alert.user_id = current_user.id
      if @alert.save
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'new'
      end
    end

    def show
    end

    def edit
      authorize :privilege, :administrator?
    end

    def update
      authorize :privilege, :administrator?
      if @alert.update(set_params)
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'edit'
      end
    end

    def destroy
      authorize :privilege, :administrator?
      flash[:success] = t :success if @alert.destroy

      redirect_to action: 'index'
    end

    private

    def set_params
      params.require(:alert).permit(:title, :content, :priority, :status, :expiration, :color)
    end

    def set_alert
      @alert = Alert.find(params[:id])
    end
  end
end