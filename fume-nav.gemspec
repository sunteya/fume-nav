# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fume/nav/version'

Gem::Specification.new do |spec|
  spec.name          = "fume-nav"
  spec.version       = Fume::Nav::VERSION
  spec.authors       = ["sunteya"]
  spec.email         = ["sunteya@gmail.com"]
  spec.summary       = %q{help build navigation for rails.}
  spec.description   = %q{help build navigation for rails.}
  spec.homepage      = "https://github.com/sunteya/fume-nav"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails"

  spec.add_development_dependency "bundler", ">= 1.7"
  spec.add_development_dependency "rake", "~> 12.0"

  spec.add_development_dependency "rspec", "~> 3.6.0"
  spec.add_development_dependency "pry-byebug"
end
