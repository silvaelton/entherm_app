module Deal
  class Purchase < ActiveRecord::Base
    belongs_to :quotation
    belongs_to :contract, class_name: "Commercial::Contract"
    belongs_to :supplier
    belongs_to :order
    belongs_to :carrier, class_name: "Deal::Supplier"

    has_many :inventories
    has_many :purchase_items
    accepts_nested_attributes_for :purchase_items, allow_destroy: true
    
    scope :this_month, -> { where(created_at: (Date.today.beginning_of_month)..(Date.today.end_of_month + 1.day)).order('created_at DESC')}
  
    scope :period, -> date_start, date_end { where(created_at: Date.parse(date_start)..Date.parse(date_end))}
    scope :status, -> (status) { where(status: status) }
    scope :by_contract, -> contract {where(contract_id: contract)}

    enum purchase_type: ['orçamento','compra']
    enum status: ['aguardando','efetuada','cancelada']
    enum freight: ['cif', 'fob']
    enum form_payment: ['dinheiro', 'boleto', 'cheque', 'cartão', 'depósito']
    enum delivery: ['imediato','7_dias', '30_dias', '60_dias','90_dias','120_dias']
    enum buy_type: ['compras', 'serviços', 'locações', 'estoque']

    validates :description, :purchase_type, :contract, :supplier, :status, presence: true
    validates :buy_type, :seller, :requester, :deadline_payment, presence: true
    validates_date :created_at, presence: true
    
    mount_uploader :inventory_flag, DocumentUploader

    after_commit :create_inventory, if: :set_inventory?

    def self.total_value
      value = 0
      all.each do |item|
        value += item.purchase_items.sum(:total_value)
      end
      value
    end
    
    def self.to_csv(options = {})
      header = %w(FPA TIPO STATUS CONTRATO DESCRIÇÃO FORNECEDOR VALOR DATA)

      CSV.generate(options) do |csv|
        csv << header 
        all.each do |item|
          csv << [item.id, item.buy_type.upcase, item.status.upcase, item.contract.title.upcase, item.description.upcase, item.supplier.name.upcase, item.purchase_items.sum(:total_value), item.created_at.strftime("%d/%m/%Y")]
        end
        csv << ['','','','','','',"TOTAL", all.total_value]
      end
    end

    def protocol
      "#{self.id}/#{self.created_at.strftime('%Y')}"
    end

    def set_inventory?
      self.estoque? && self.efetuada? && self.compra?
    end

    private

    def create_inventory
      if purchase_items.present?
        purchase_items.each do |item|
          @inventory = Inventory.find(product_id: item.product_id) rescue nil

          if @inventory.present?
            @inventory.update(quantity: @inventory.quantity + item.quantity)
          else
            @inventory = Inventory.new({
              purchase_id: self.id,
              quantity: item.quantity,
              product_id: item.product_id,
              estimed_value: item.unit_value,
              unit: item.unit
            })

            @inventory.save
          end
        end
      end
    end
  end
end
