module Deal
  class Purchase < ActiveRecord::Base
    belongs_to :quotation
    belongs_to :contract, class_name: "Commercial::Contract"
    belongs_to :supplier
    belongs_to :order

    has_many :purchase_items
    accepts_nested_attributes_for :purchase_items, allow_destroy: true
    
    scope :this_month, -> { where(created_at: Date.today.beginning_of_month..Date.today.end_of_month).order('created_at DESC')}

    enum purchase_type: ['orçamento','compra']
    enum status: ['aguardando','efetuada','cancelada']

    validates :description, :purchase_type, :contract, :supplier, :status, presence: true


    def self.search(search_params)
      
      date_start = search_params[:date_start] ? Date.parse(search_params[:date_start]) : Date.today.beginning_of_month 
      date_end   = search_params[:date_end] ? Date.parse(search_params[:date_end]) : Date.today.end_of_month 

      query = where(created_at: date_start..date_end) 
      query = query.where("contract_id = #{search_params[:contract_id]}") if search_params[:contract_id].present?
      query = query.where("status = #{search_params[:status_id]}")        if search_params[:status_id].present?

      query.includes([:supplier, :purchase_items])
    end
  end
end
