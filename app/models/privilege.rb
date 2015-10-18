class Privilege < ActiveRecord::Base

  def complete_name
    "<b>#{self.system_name}</b> / #{self.name}".html_safe
  end
end
