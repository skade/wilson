module YARD
  module Generators
    class ClassGenerator      
      def sections_for(object) 
        [
          :header,
          [
            G(InheritanceGenerator), 
            G(MixinsGenerator, :scope => :class),
            G(MixinsGenerator, :scope => :instance),
            G(DocstringGenerator), 
            G(TagsGenerator),
            G(AttributesGenerator), 
            G(ConstantsGenerator),
            G(ConstructorGenerator),
            G(MethodMissingGenerator),
            G(RoutesGenerator),
            G(VisibilityGroupGenerator, :visibility => :public),
            G(VisibilityGroupGenerator, :visibility => :protected),
            G(VisibilityGroupGenerator, :visibility => :private)
          ]
        ]
      end
    end
    
    module HTTP
      class TagsGenerator < YARD::Generators::TagsGenerator
        before_section :todo, :has_todo?
        
        def sections_for(object)
          sections = [
            :header, [ :url_param, :get, :post, :output_types, :output_languages,
              :example, :raise, :todo, :author, :version, :since, :see ]
          ]
          sections
        end
        
        def url_param(object)
          render_tags :url_param, :no_types => true
        end
        
        def get(object)
          render_tags :get, :no_types => true
        end
        
        def post(object)
          render_tags :post, :no_types => true
        end
        
        def output_languages(object)
          render_tags :output_languages
        end
        
        def output_types(object)
          render_tags :output_types
        end
      end
    end
    
    class RoutesGenerator < YARD::Generators::Base
      before_section :header, :has_routes?
      
      def sections_for(object)
        [:header,
          [ 
            :title,
            [
              G(DocstringGenerator),
              G(HTTP::TagsGenerator),
              G(SourceGenerator)
            ]
          ]
        ]
      end
      
      def has_routes?(object)
        object[:routes] && object[:routes].size > 0 ? true : false
      end
    end
  end
end