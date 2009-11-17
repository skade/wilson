require "yard"
require "tags/register_tags"
require "coderay"

if RUBY19
  require "handlers/sinatra_route_handler"
else
  warn("starting Wilson in 1.8 compatibility mode. Parsing is deactivated")
end

require "code_objects/sinatra_route"

YARD::Templates::Engine.register_template_path(
  File.dirname(__FILE__) + '/../templates/'
)