class DealPolicy < ApplicationPolicy

  # suppliers

  def suppliers_view?
    suppliers_full? || suppliers_index?
  end
  
  def suppliers_full?
    privilege('deal', 1).where(id: user.privilege_id).present? || user.administrador?
  end

  def suppliers_index?
    privilege('deal', 2).where(id: user.privilege_id).present? || user.administrador?
  end

  # purchases

  private

  def privilege(system, code)
    Privilege.where(system_code: system, code: code)
  end
end