module Deal
  class OrderComment < ActiveRecord::Base
    belongs_to :user
  end
end
