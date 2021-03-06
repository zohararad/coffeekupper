# -*- encoding: utf-8 -*-
require File.expand_path('../lib/coffeekupper/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Zohar Arad"]
  gem.email         = ["zohar@zohararad.com"]
  gem.description   = %q{CoffeeKup compiler for Asset Pipeline}
  gem.summary       = %q{Write client side templates in Rails using CoffeeKup}
  gem.homepage      = "https://github.com/zohararad/coffeekupper"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "coffeekupper"
  gem.require_paths = ["lib"]
  gem.version       = Coffeekupper::VERSION

  gem.add_dependency             'sprockets', '>= 2.1.3'
  gem.add_development_dependency 'therubyracer'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rails', '>= 3.1.1'
end
