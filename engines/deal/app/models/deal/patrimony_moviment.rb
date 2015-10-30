module Deal
  class PatrimonyMoviment < ActiveRecord::Base
    belongs_to :origin_contract,  class_name: "Commercial::Contract"
    belongs_to :current_contract, class_name: "Commercial::Contract"
    belongs_to :user
    belongs_to :items, class_name: "Deal::Patrimony"

    scope :by_period,     -> date_start, end_date { where(created_at: date_start..end_date)}
    scope :contract,      -> contract { where(current_contract_id: contract)}
    scope :moviment_type,      -> moviment_type { where(moviment_type: moviment_type)}

    enum moviment_type: ['emprestando', 'devolvendo']

    def view_items 
      Deal::Patrimony.where(id: self.items_id)
    end
  end
end
