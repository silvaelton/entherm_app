module Deal
  class Inventory < ActiveRecord::Base
    belongs_to :product
    belongs_to :contract, class_name: "Commercial::Contract"
    belongs_to :purchase

    enum state: ['novo', 'semi_novo', 'bom_estado', 'conservado', 'usado', 'péssimo', 'velho', 'consertar']

    attr_accessor :in_quantity    
    
    validates :product_title, :quantity, presence: true    
    validates :quantity, numericality: true

    mount_uploader :image_path, ImageUploader
    
    def product_title
      product.try(:title)
    end

    def product_title=(title)
      self.product = Product.find_or_create_by(title: title.downcase) if title.present?
    end

  end
end
