module Access
  class UserContract < ActiveRecord::Base
    belongs_to :user
    belongs_to :contract

    validates :contract, presence: true, uniqueness: {scope: :user}
  end
end
