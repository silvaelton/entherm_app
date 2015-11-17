require_dependency 'personal_departament/application_controller'
module PersonalDepartament
  class AttachmentsController < ApplicationController
    before_action :set_staff

    def index
      @attachment = Attachment.new
    end

    def new
    end

    def create
      @attachment = @staff.attachments.new(set_params)

      if @attachment.save
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'index'
      end

    end

    def edit
    end

    def update
    end

    def destroy
      @attachment = @staff.attachments.find(params[:id])

      if @attachment.destroy
        flash[:success] = t :success
      else
        flash[:danger] = t :danger
      end

      redirect_to action: 'index'
    end

    private

    def set_params
      params.require(:attachment).permit(:title, :description, :file_path)
    end

    def set_staff
      @staff = Staff.find(params[:staff_id])
    end

    def set_attachment
    end
  end
end
