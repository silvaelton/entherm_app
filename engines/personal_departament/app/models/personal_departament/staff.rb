module PersonalDepartament
  class Staff < ActiveRecord::Base
    belongs_to :contract, class_name: "Commercial::Contract"
    belongs_to :state, class_name: "Information::State"
    belongs_to :city, class_name: "Information::City"
    belongs_to :job
    belongs_to :sector

    has_many :dependents
    accepts_nested_attributes_for :dependents, allow_destroy: true

    enum situation: [:experiência, :contratado, :demitido, :justa_causa, :afastado]
    enum civil_state: [:solteiro, :uniao_estavel]
    enum gender: [:masculino, :feminino]

    validates :name, :rg, :cpf, :rg_org, :rg_date, :pis, :ctps, :ctps_serie,
              :pis, :voter_registration, :voter_zone, :voter_session, :born,
              :bank, :bank_agency, :bank_account, :address, :burgh, :city, :state, 
              :cep, :telephone, :gender, :naturality, 
              :civil_state, :education, :salary, :job, :sector, :contract, :height,
              :blood, :badge_name, :situation, :situation, :civil_state,
              :salary, :work_start, :education, :work_end, presence: true

  end
end
