
module YARD::Handlers::Ruby
  class SinatraRouteHandler < Base
    %w(get post put delete head trace).each do |http_method|
      handles method_call(http_method)
    end
    
    def self.register_command(name, object_generator)
      commands[name] = object_generator
    end
    
    def self.commands
      @commands ||= {}
    end
    
    def process
      method = statement[0][0].upcase
      route_def = statement[1][0]
      
      case route_def.type
      when :regexp_literal
        route_string = route_def[0][0][0]
        route_object = Regexp.new(route_string)
      when :string_literal
        route_object = route_string = route_def[0][0][0]
      when :command
        route_string = route_def.jump(:tstring_content)[0]
        ident = route_def.jump(:ident)[0]
        if generator = self.class.commands[ident]
          route_object = generator.call(route_string)
        end
      when :call
        warn("Wilson does not support generating docs for Calls")
        return
      end
      
      owner[:routes] ||= []

      owner[:routes] << register(SinatraRoute.new(namespace, route_string)) do |o|
        o.http_method  = method
        o.route_object = route_object
        o.route        = route_string
        o.source       = statement.source
        
        if route_object.respond_to? :keys
          o.parameters = route_object.keys
        elsif route_object.respond_to? :to_str
          o.parameters = keys(route_object)
        else
          o.parameters = []
        end
      end
    end
    
    def keys(path)
      keys = []
      special_chars = %w{. + ( )}
      path.to_str.gsub(/((:\w+)|[\*#{special_chars.join}])/) do |match|
        case match
        when "*"
          keys << 'splat'
          "(.*?)"
        when *special_chars
          Regexp.escape(match)
        else
          keys << $2[1..-1]
          "([^/?&#]+)"
        end
      end
      keys
    end
  end
end