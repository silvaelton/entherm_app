module Deal
  class InventoryLog < ActiveRecord::Base
    belongs_to :inventory 
    belongs_to :contract, class_name: "Commercial::Contract"
    

    scope :by_period,     -> date_start, end_date { where(created_at: Date.parse(date_start)..Date.parse(end_date))}
    scope :contract,      -> contract { where(contract_id: contract)}
    scope :item,          -> item { where(inventory_id: item)}
    scope :log_type,      -> log_type { where(log_type: log_type)}

    enum log_type: ['entrada', 'saída']

    validates :quantity, numericality: true, presence: true
    validates :description, :inventory, presence: true

    validate :quantity_out, if: :out?

    after_create :set_quantity
    before_destroy :set_new_quantity

    def inventory_product_name
      inventory.try(:product_name)
    end

    private

    def set_new_quantity
      inventory = Inventory.find(self.inventory_id) rescue nil
      
      if inventory.present? 
        if self.entrada? 
          inventory.update(quantity: inventory.quantity - self.quantity)
        else
          inventory.update(quantity: inventory.quantity + self.quantity)
        end
      end
    end

    def out?
      self.saída?
    end

    def quantity_out
      if inventory.quantity < self.quantity
        errors.add(:quantity, 'A quantidade é maior do que tem dispónivel em estoque')
      end
    end

    def set_quantity
      @inventory = inventory

      if self.entrada?
        @quantity  = @inventory.quantity + self.quantity
      else
        @quantity  = @inventory.quantity - self.quantity
      end
      @inventory.update(quantity: @quantity)
    
    end
  end
end
