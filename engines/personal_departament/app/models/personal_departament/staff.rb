module PersonalDepartament
  class Staff < ActiveRecord::Base
    belongs_to :contract, class_name: "Commercial::Contract"
    belongs_to :state, class_name: "Information::State"
    belongs_to :city, class_name: "Information::City"
    belongs_to :job
    belongs_to :sector

    validates :name, :code, :rg, :cpf, :rg_org, :rg_date, :pis, :ctps, :ctps_serie,
              :pis, :voter_registration, :voter_zone, :voter_session, :born,
              :bank, :bank_agency, :bank_account, :address, :burgh, :city, :state, 
              :cep, :telephone, :name_father, :name_mother, :gender, :naturality, 
              :civil_state, :education, :salary, :job, :sector, :contract, :height,
              :weight, :blood, :badge_name, :situation, presence: true
  end
end
