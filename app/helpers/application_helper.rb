module ApplicationHelper
    def link_to_add_fields(name, f, association)
        new_object = f.object.send(association).klass.new
        id = new_object.object_id
        fields = f.fields_for(association, new_object, child_index: id) do |builder|
            render(association.to_s.singularize + "_fields", f: builder)
        end
        link_to(name,"#", class: "add_fields btn btn-primary col-xs-12", data: {id:id, fields: fields.gsub("\n","")})
    end

    def active_class(link_path)
        
        if link_path.include? "page"
            puts "it have"
        end
        current_page?(link_path) ? "active" : ""
    end
end

