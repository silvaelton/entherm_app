module Deal
  class Inventory < ActiveRecord::Base
    belongs_to :product
    belongs_to :contract, class_name: "Commercial::Contract"


    default_scope {order('created_at DESC')}
  
    attr_accessor :in_quantity    
    
    validates :product_title, :quantity, presence: true    
    validates :quantity, numericality: true

    def self.search(search_params)
      if search_params.present? && search_params[:contract_id].present?
        query = includes(:contract).where("contract_id = #{search_params[:contract_id]}")
      else
        query = all 
      end
    end


    def product_title
      product.try(:title)
    end

    def product_title=(title)
      self.product = Product.find_or_create_by(title: title.downcase) if title.present?
    end

  end
end
