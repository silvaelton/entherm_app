module Deal
  class Patrimony < ActiveRecord::Base
    belongs_to :contract, class_name: "Commercial::Contract"

    enum state: ['novo', 'bom', 'usado', 'velho', 'pessimo', 'obsoleto']
    validates :contract_id, :title, :state, presence: true


    def self.search(search_params)

      if search_params.present?
        query = all
        query = query.where("contract_id = #{search_params[:contract_id]}") if search_params[:contract_id].present?
        query = query.where("state = #{search_params[:state_id]}")  if search_params[:state_id].present?
      else
        all
      end
    end


  end
end
