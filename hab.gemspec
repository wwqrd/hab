# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hab/version'

Gem::Specification.new do |spec|
  spec.name          = 'hab'
  spec.version       = Hab::VERSION
  spec.authors       = ['Stephen Mckellar']
  spec.email         = ['stephen@thingmaker.io']
  spec.summary       = 'A command line interface for Habitica'
  spec.homepage      = ''
  spec.license       = 'MIT'
  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.2'
  spec.add_development_dependency 'webmock', '~> 1.2'
  spec.add_development_dependency 'vcr', '~> 2.9'
  spec.add_development_dependency 'pry', '~> 0.10'
  spec.add_development_dependency 'rubocop', '~> 0.32'
  spec.add_runtime_dependency 'habit_client', '0.0.6'
  spec.add_runtime_dependency 'rumoji', '~> 0.4'
  spec.add_runtime_dependency 'colorize', '~> 0.7'
  spec.add_runtime_dependency 'commander', '~> 4.3'

end
