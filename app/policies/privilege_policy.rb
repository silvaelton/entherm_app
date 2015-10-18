class PrivilegePolicy < ApplicationPolicy

  def deal?
    Privilege.where(id: user.privilege_id).present?
  end
end