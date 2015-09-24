module Deal
  class Supplier < ActiveRecord::Base
    belongs_to :supplier_category
    belongs_to :city
    belongs_to :state

    validates :name, :state, :city, :contact_name, :contact_telephone, presence: true
    validates :cnpj, cnpj: true, allow_blank: true
    validates :supplier_category, presence: true

    validates :contact_telephone, numericality: true
    validates :contact_telephone_optional, :contact_celphone, :contact_celphone_optional, numericality: true, allow_blank: true
  end
end
