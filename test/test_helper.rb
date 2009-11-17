require 'wilson'
require 'shoulda'
require 'test/unit'

# taken from yard
def parse_file(file, thisfile = __FILE__, log_level = log.level)
  YARD::Registry.clear
  path = File.join(File.dirname(thisfile), 'examples', file.to_s + '.rb.txt')
  YARD::Parser::SourceParser.parse(path, log_level)
end