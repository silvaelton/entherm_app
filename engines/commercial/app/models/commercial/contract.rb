module Commercial
  class Contract < ActiveRecord::Base
    has_many :purchases, class_name: "Deal::Purchase"
  end
end
