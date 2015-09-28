module Deal
  class Purchase < ActiveRecord::Base
    belongs_to :quotation
    belongs_to :contract, class_name: "Commercial::Contract"
    belongs_to :supplier
    belongs_to :order
    belongs_to :carrier, class_name: "Deal::Supplier"

    has_many :purchase_items
    accepts_nested_attributes_for :purchase_items, allow_destroy: true
    
    scope :this_month, -> { where(created_at: Date.today.beginning_of_month..Date.today.end_of_month).order('created_at DESC')}

    enum purchase_type: ['orçamento','compra']
    enum status: ['aguardando','efetuada','cancelada']
    enum freight: ['cif', 'fob']
    enum form_payment: ['dinheiro', 'boleto', 'cheque', 'cartão', 'depósito']
    enum delivery: ['imediato','7_dias', '30_dias', '60_dias','90_dias','120_dias']
    enum buy_type: ['compras', 'serviços', 'locações']

    validates :description, :purchase_type, :contract, :supplier, :status, presence: true
    validates :buy_type, :seller, :requester, :deadline_payment, presence: true

    def self.search(search_params)
      
      date_start = Date.today.beginning_of_month 
      date_end   = Date.today.end_of_month 

      if search_params.present?

        date_start = search_params[:date_start] ? Date.parse(search_params[:date_start]) : date_start
        date_end   = search_params[:date_end] ? Date.parse(search_params[:date_end]) : date_end
  
        query = where(created_at: date_start..date_end) 
        query = query.where("contract_id = #{search_params[:contract_id]}") if search_params[:contract_id].present?
        query = query.where("status = #{search_params[:status_id]}")        if search_params[:status_id].present?
  
        query.includes([:supplier, :purchase_items])

      else
         query = where(created_at: date_start..date_end) 
      end
    end
  end
end
