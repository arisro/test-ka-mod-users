# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ka_mod_users/version'

Gem::Specification.new do |spec|
  spec.name          = "ka_mod_users"
  spec.version       = KaModUsers::VERSION
  spec.authors       = ["Buzachis Aris"]
  spec.email         = ["buzachis.aris@gmail.com"]
  spec.description   = %q{KA users MOD gem}
  spec.summary       = %q{KA users MOD gem}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.required_ruby_version = '>= 2.0.0'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency 'rails', '~> 4.0.0'
  spec.add_dependency "rack", "~> 1.5.2"
  spec.add_dependency 'rest-client', '~> 1.6.7'
  spec.add_dependency 'roar-rails'
  spec.add_dependency 'rack-cors'
end