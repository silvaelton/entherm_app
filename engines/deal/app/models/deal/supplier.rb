module Deal
  class Supplier < ActiveRecord::Base
    belongs_to :supplier_category
    belongs_to :city
    belongs_to :state

  end
end
