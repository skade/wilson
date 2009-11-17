module YARD::CodeObjects
  class SinatraRoute < Base
    attr_accessor :http_method, :route, :parameters
    
    def name
      route
    end
    
    def aliases
      []
    end
  end
end