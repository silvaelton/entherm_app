module PersonalDepartament
  class Staff < ActiveRecord::Base

    scope :by_contract, -> (contract) {where(contract_id: contract)}
    scope :status,  -> (status) { where(situation: status)}
    
    belongs_to :contract, class_name: "Commercial::Contract"
    belongs_to :state, class_name: "Information::State"
    belongs_to :city, class_name: "Information::City"
    belongs_to :job
    belongs_to :sector

    has_many :dependents
    has_many :attachments
    
    accepts_nested_attributes_for :dependents, allow_destroy: true

    enum situation: [:experiência, :contratado, :demitido, :justa_causa, :afastado]
    enum civil_state: [:solteiro, :casado, :uniao_estável, :viúvo]
    enum gender: [:masculino, :feminino]
    enum kinship: [:filho, :pai_ou_mãe, :esposa, :avós, :primo, :outro]

    validates :name, :rg, :cpf, :rg_org, :rg_date, :pis, :ctps, :ctps_serie,
              :pis, :voter_registration, :voter_zone, :voter_session, :born,
              :bank, :bank_agency, :bank_account, :address, :burgh, :city_id, :state, 
              :cep, :telephone, :gender, :naturality, 
              :civil_state, :education, :salary, :job, :contract, :badge_name,
              :situation, :situation, :civil_state, :salary, presence: true

    mount_uploader :picture, FileUploader
    mount_uploader :badge_picture, FileUploader

  end
end
