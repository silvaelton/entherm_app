module Deal
  class PatrimonyMoviment < ActiveRecord::Base
    belongs_to :origin_contract,  class_name: "Commercial::Contract"
    belongs_to :current_contract, class_name: "Commercial::Contract"
    belongs_to :user
    belongs_to :items, class_name: "Deal::Patrimony"

    
    def view_items 
      Deal::Patrimony.where(id: self.items_id)
    end
  end
end
