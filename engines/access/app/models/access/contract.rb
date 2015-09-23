require_dependency 'commercial/contract'
module Access
  class Contract < Commercial::Contract
    has_many :user_contracts
  end
end