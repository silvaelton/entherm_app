module Deal
  class Order < ActiveRecord::Base
    belongs_to :user
    belongs_to :contract, class_name: "Commercial::Contract"
    has_many   :order_items

    default_scope { order('created_at DESC')}
    scope :this_month, -> { where(created_at: Date.today.beginning_of_month..Date.today.end_of_month, status: 0).order('created_at DESC')}

    enum status: [:pendente, :processando, :cancelado, :atendido]

    validates :description, presence: true

    accepts_nested_attributes_for :order_items, allow_destroy: true

    validate :user_contract?

    mount_uploader :pdf, Deal::DocumentUploader

    def protocol
      "P#{self.id}/#{self.created_at.strftime('%Y')}"
    end

    def set_user(user)
      self.user_id = user.id
    end

    def self.search(search_params)
      
      date_start = Date.today.beginning_of_month 
      date_end   = Date.today.end_of_month 

      if search_params.present?
        date_start = search_params[:date_start] ? Date.parse(search_params[:date_start]) : date_start
        date_end   = search_params[:date_end] ? Date.parse(search_params[:date_end]) : date_end
  
        query = where(created_at: date_start..date_end) 
        query = query.where("contract_id = #{search_params[:contract_id]}") if search_params[:contract_id].present?
        query = query.where("status = #{search_params[:status_id]}")        if search_params[:status_id].present?

        query
      else
         query = where(created_at: date_start..date_end) 
      end
    end

    private

    def user_contract?
      @user_contract = Access::UserContract.where(user_id: self.user_id, contract_id: self.contract_id)
      errors.add(:contract, 'Você não tem permissão de realizar pedidos neste contrato') unless @user_contract.present?
    end
  end
end
