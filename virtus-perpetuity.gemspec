# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'virtus/perpetuity/version'

Gem::Specification.new do |spec|
  spec.name          = "virtus-perpetuity"
  spec.version       = Virtus::Perpetuity::VERSION
  spec.authors       = ["Craig Buchek"]
  spec.email         = ["craig@boochtek.com"]
  spec.description   = %q{Use Virtus to define attributes for models mapped with Perpetuity}
  spec.summary       = %q{Use Virtus to define attributes for models mapped with Perpetuity}
  spec.homepage      = "https://github.com/boochtek/virtus-perpetuity"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency('virtus', '~> 1.0')
  spec.add_runtime_dependency('perpetuity', '~> 1.0.0.beta3')

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.14"
  spec.add_development_dependency('perpetuity-memory', '~> 0.1.1')
end
