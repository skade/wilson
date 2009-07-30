require 'test/test_helper'

class SinatraRouteHandlerTest < Test::Unit::TestCase
  include YARD
  
  context "The SinatraRouteHandler" do
    should "Determine basic routes correctly" do
      parse_file "basic", __FILE__
      
      routes = P("Basic").routes
      
      assert_equal("/foo/:bar", routes[0].route)
      assert_equal("/foo", routes[1].route)
      assert_equal(["bar"], routes[0].parameters)
    end
    
    should "Determine Regexp routes correctly" do
      parse_file "regular_expressions", __FILE__
      
      routes = P("RegularExpressions").routes
      
      assert_equal("/foo/bar", routes[0].route)
      assert_equal(%r{/foo/bar}, routes[0].route_object)
      assert_equal("foo\\/bar", routes[1].route)
      assert_equal(%r{foo/bar}.to_s, routes[1].route_object.to_s)
    end
    
    should "Determine Routes with calls correctly" do
      gen = lambda do |string|
              require 'addressable/template'
              Addressable::Template.new(string)
            end
      YARD::Handlers::Ruby::SinatraRouteHandler.register_command("t", gen)
      parse_file "calls", __FILE__
      
      routes = P("Calls").routes
      assert_equal("/test/{bla}", routes[0].route)
      assert_equal(["bla"], routes[0].parameters)
      assert_kind_of(Addressable::Template, routes[0].route_object)
    end
  end
end