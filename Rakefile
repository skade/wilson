require 'yard'
require 'rake/gempackagetask'
require 'rake/testtask'

gem = Gem::Specification.new do |gem|
  gem.author      = "Florian Gilcher"
  gem.email       = "flo@andersground.net"

  gem.rubyforge_project = "skades_gems"

  gem.name        = "wilson"

  gem.version     = "0.0.1"
  gem.summary     = "Wilson documents Sinatra"
  
  gem.description = "Wilson is Sinatras first Biographer"
  gem.bindir      = "bin"
  gem.homepage    = "http://skadesgems.rubyforge.org"
  gem.files       = FileList['**/*'].exclude('_darcs')
  gem.has_rdoc    = true
end

Rake::GemPackageTask.new(gem).define

Rake::TestTask.new do |t|
  t.libs << "test"
  t.pattern = 'test/**/*_test.rb'
end
