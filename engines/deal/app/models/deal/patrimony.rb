module Deal
  class Patrimony < ActiveRecord::Base
    belongs_to :contract
  end
end
