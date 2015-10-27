class PrivilegePolicy < ApplicationPolicy


  def requester?
    user.solicitante?
  end

  def administrator?
    user.administrador?
  end

  def simple?
    user.simples?
  end

  def deal?
    Privilege.where(id: user.privilege_id).present? || :administrador?
  end
end