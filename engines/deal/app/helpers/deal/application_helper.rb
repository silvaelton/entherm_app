module Deal
  module ApplicationHelper
    def link_to_add_fields(name, f, association)
      new_object = f.object.send(association).klass.new
      id = new_object.object_id
      fields = f.fields_for(association, new_object, child_index: id) do |builder|
        render(association.to_s.singularize + "_fields", f: builder)
      end

      link_to(name, '#', class: "add_fields btn btn-primary btn-xs", data: {id: id, fields: fields.gsub("\n", "")})
    end

    def status_helper(status)
      case status
      when 'pendente'
        "<span class='label label-danger'>Pendente</span>".html_safe
      when 'processando'
        "<span class='label label-primary'>Processando</span>".html_safe
      when 'cancelado'
        "<span class='label label-warning'>Cancelado</span>".html_safe
      when 'atendido'
        "<span class='label label-success'>Atendido</span>".html_safe
      end
        
    end
  end
end
