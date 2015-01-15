lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano-forever'

Gem::Specification.new do |gem|
  gem.name          = "capistrano-forever"
  gem.version       = Capistrano::Forever::VERSION
  gem.authors       = ["lamp"]
  gem.email         = ["matthew.gradidge@gmail.com"]
  gem.description   = %q{}
  gem.summary       = %q{}
  gem.homepage      = "http://github.com/lamp/capistrano-forever"
  gem.license       = "WTFPL"

  gem.files         = `git ls-files`.split($/)
  gem.require_paths = ["lib"]

  gem.add_dependency 'capistrano', '>= 3.0'
end