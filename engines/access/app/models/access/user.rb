require_dependency 'user'

module Access
	class User < ::User
    has_many :user_contracts
    accepts_nested_attributes_for :user_contracts, allow_destroy: true

    enum user_type: ['simples', 'solicitante', 'administrador']

		validates :name, :user_type, presence: true
	end
end