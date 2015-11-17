module PersonalDepartament
  class Sector < ActiveRecord::Base
    belongs_to :contract, class_name: "Commercial::Contract"

    validates :contract, :title, presence: true
  end
end
