module Deal
  class Invetory < ActiveRecord::Base
    belongs_to :product
  end
end
