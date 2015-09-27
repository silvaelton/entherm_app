module Deal
  class Quotation < ActiveRecord::Base
    belongs_to :contract, class_name: "Commercial::Contract"
    belongs_to :order
    
    enum status: [:processando, :concluida]

    validates_presence_of :contract, :description, :status

    def self.search(search_params)
      if search_params.present? && search_params[:contract_id].present?
        query = includes(:contract).where("contract_id = #{search_params[:contract_id]}")
      else
        query = all 
      end
    end


  end
end
