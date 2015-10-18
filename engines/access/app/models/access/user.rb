require_dependency 'user'

module Access
	class User < ::User
		validates :name, :user_type, presence: true
	end
end