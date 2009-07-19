require 'wilson'
require 'json/pure'

module Wilson
  module Web
    def self.included(base)
      
      base.get '/wilson' do
        content_type 'text/plain'
        
        state = JSON::Pure::Generator::State.new(
          :indent => '  ',
          :object_nl => "\n",
          :array_nl => "\n"
        )
        
        YARD::Registry.load
        code_obj = YARD::Registry[base.name]
        code_obj[:routes].map do |route|
          hsh = {
            :route => route.route,
            :description => route.docstring
          }
          hsh[:properties] = {}
          
          route.tags.each do |tag| 
            hsh[:properties][tag.tag_name] = { 
                                              :types => tag.types, 
                                              :desc  => tag.text
                                             }
          end
          
          hsh
        end.to_json(state)
      end
    end
  end
end