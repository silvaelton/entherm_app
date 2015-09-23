module Information
  class State < ActiveRecord::Base
    has_many :cities
  end
end
