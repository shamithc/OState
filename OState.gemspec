# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'OState/version'

Gem::Specification.new do |spec|
  spec.name          = "OState"
  spec.version       = OState::VERSION
  spec.authors       = ["shamithc"]
  spec.email         = ["shamithc@gmail.com"]
  spec.summary       = %q{ Accessing state legislative information. }
  spec.description   = %q{ Ruby library for accessing legislative data from all 50 states,
                            Washington D.C. and Puerto Rico, and then make it available in
                            a common format}
  spec.homepage      = "http://sunlightlabs.github.io/openstates-api/index.html"
  spec.license       = "MIT"
  spec.files         = Dir.glob ["lib/**/*.{rb,crt}", "spec/**/*", "*.gemspec"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "bundler", "~> 1.7"
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'
end
