module Deal
  class Patrimony < ActiveRecord::Base
    belongs_to :contract, class_name: "Commercial::Contract"

    scope :by_contract, -> contract {where(contract_id: contract)}
    
    enum state: ['novo', 'bom', 'usado', 'velho', 'pessimo', 'obsoleto']

    validates :contract_id, :title, :state, presence: true
    validates :quantity, numericality: true, presence: true
    validates :original_value, :estimated_value, presence: true
    validates_date :buy_date, date: true, presence: true


  end
end
