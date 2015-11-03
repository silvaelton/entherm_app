module Commercial
  class Contract < ActiveRecord::Base
    has_many :purchases, class_name: "Deal::Purchase"
    belongs_to :company

#    validates_presence_of :title, :company
    validates_uniqueness_of :title

    def total_value(period = {})
      value = 0

      start_date  = Date.parse(period[:date_start]) rescue nil
      end_date    = Date.parse(period[:date_end]) rescue nil

      purchases.where(status: 1, created_at: start_date..end_date).each do |p|
        value += p.purchase_items.sum(:total_value)
      end

      value
    end
  end
end
