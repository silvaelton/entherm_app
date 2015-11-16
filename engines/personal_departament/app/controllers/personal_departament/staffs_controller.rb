require_dependency 'personal_departament/application_controller'
module PersonalDepartament
  class StaffsController < ApplicationController
    before_action :set_staff, only: [:edit, :update, :destroy, :show]

    def index
      @staffs = Staff.all.order(:name)
    end

    def show
    end

    def new
      @staff = Staff.new
    end

    def create
      @staff = Staff.new(set_params)

      if @staff.save
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'new'
      end
    end

    def edit
    end

    def update
      if @staff.update(set_params)
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'edit'
      end
    end

    def destroy
      if @staff.destroy
        flash[:success] = t :success
      else
        flash[:danger] = t :danger
      end
      
      redirect_to action: 'index'
    end

    private

    def set_params
      params.require(:staff).permit(:contract_id, :situation, :experience_start, :experience_end, :born, :cpf, 
                                    :rg, :rg_org, :rg_date, :civil_state, :cnh, :cnh_category, :cnh_uf, :ctps,
                                    :ctps_serie, :pis, :voter_registration, :voter_zone, :voter_session, :reservist,
                                    :reservist_serial, :reservist_uf, :reservist_date, :height, :weight, :blood, 
                                    :special_condition_flag, :special_condition, :job_id, :sector_id, :salary, 
                                    :bank, :bank_agency, :bank_account, :state_id, :city_id, :address, :burgh, :cep, 
                                    :transportation_line, :transportation_company, :transportation_voucher, :transportation_observation, 
                                    :telephone, :telephone_optional, :celphone, :name_father, :name_mother, :badge_name, :tshirt_size, 
                                    :pants_size, :skirt_size, :shoe_size, :drt, :registry, :number_book, :number_flet, :admission, 
                                    :medications, :diseases, :allergies, :staff_performance_observation, :name, :work_start, :work_end)
    end

    def set_user
      @staff = Staff.find(params[:id])
    end

  end
end
