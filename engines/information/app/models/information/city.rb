module Information
  class City < ActiveRecord::Base
    belongs_to :state
  end
end
