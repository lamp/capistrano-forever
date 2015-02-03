Gem::Specification.new do |gem|
  gem.name          = "capistrano-forever"
  gem.version       = "0.0.1"
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
