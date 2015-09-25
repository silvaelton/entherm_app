module Deal
  class PurchaseItem < ActiveRecord::Base
    belongs_to :purchase
    belongs_to :product

    validates :product_title, :unit, presence: true
    validates :quantity, presence: true, numericality: true

    include ::Unit

    def product_title
      product.try(:title)
    end

    def product_title=(title)
      self.product = Product.find_or_create_by(title: title.downcase) if title.present?
    end
  end
end
