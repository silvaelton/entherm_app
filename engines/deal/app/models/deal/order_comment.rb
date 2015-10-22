module Deal
  class OrderComment < ActiveRecord::Base
    belongs_to :user
    belongs_to :order
  end
end
