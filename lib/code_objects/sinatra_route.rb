module YARD::CodeObjects
  class SinatraRoute < Base
    attr_accessor :http_method, :route
    
    def parameters
      []
    end
  end
end