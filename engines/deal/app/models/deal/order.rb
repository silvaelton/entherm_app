module Deal
  class Order < ActiveRecord::Base
    belongs_to :user
    belongs_to :contract, class_name: "Commercial::Contract"
    has_many   :order_items

    default_scope { order('created_at ASC')}
    enum status: [:pendente, :processando, :cancelado, :atendido]

    validates :description, presence: true

    accepts_nested_attributes_for :order_items, allow_destroy: true

    validate :user_contract?

    def set_user(user)
      self.user_id = user.id
    end

    private

    def user_contract?
      @user_contract = Access::UserContract.where(user_id: self.user_id, contract_id: self.contract_id)
      errors.add(:contract, 'Você não tem permissão de realizar pedidos neste contrato') unless @user_contract.present?
    end
  end
end
