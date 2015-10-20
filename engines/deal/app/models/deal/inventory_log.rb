module Deal
  class InventoryLog < ActiveRecord::Base
    belongs_to :inventory 

    enum log_type: ['entrada', 'saída']

    validates :quantity, numericality: true, presence: true
    validates :description, :inventory, presence: true

    validate :quantity_out, if: :out?

    after_create :set_quantity

    def inventory_product_name
      inventory.try(:product_name)
    end

    private

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
