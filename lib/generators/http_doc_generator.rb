module YARD
  module Generators
    module Wilson
      module Helper
        def render_sidebar(object)
          render(:sidebar)
        end
      end
      
      class HTTPDocGenerator
        before_list :basedoc
        before_list :head
        
        def sections_for(object) 
          case object
          when CodeObjects::ClassObject
            [:header, :sidebar, G(Wilson::ClassGenerator)]
          when CodeObjects::ModuleObject
            [:header, :sidebar, G(Wilson::ModuleGenerator)]
          end
        end
      end
      
      class ClassGenerator     
        include Helper
         
        def sections_for(object) 
          [
            :header,
            [
              G(InheritanceGenerator),
              G(DocstringGenerator),
              G(Wilson::TagsGenerator),
              G(RoutesGenerator)
            ]
          ]
        end
      end
    end
  end
end