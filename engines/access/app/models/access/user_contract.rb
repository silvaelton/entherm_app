module Access
  class UserContract < ActiveRecord::Base
    belongs_to :user
    belongs_to :contract

    validates :contract, uniqueness: {scope: :user}, allow_blank: true
    
  end
end
