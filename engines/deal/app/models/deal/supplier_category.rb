module Deal
  class SupplierCategory < ActiveRecord::Base
    has_many :suppliers

    validates :title, presence: true, uniqueness: true

  end
end
