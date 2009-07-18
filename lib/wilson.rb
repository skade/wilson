require "yard"
require "tags/register_tags"
require "handlers/sinatra_route_handler"
require "generators/routes"
require "code_objects/sinatra_route"

YARD::Generators::Base.register_template_path File.dirname(__FILE__) + '/../templates/'
