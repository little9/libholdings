# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'libholdings/version'

Gem::Specification.new do |spec|
  spec.name          = "libholdings"
  spec.version       = Libholdings::VERSION
  spec.licenses      = ["Apache-2.0"]
  spec.authors       = ["Jamie Little"]
  spec.email         = ["j.little@miami.edu"]
  spec.summary       = "A gem for getting item holdings data from a z39.50 server"


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"

  spec.add_runtime_dependency "zoom"
  spec.add_runtime_dependency "nokogiri"
  spec.add_runtime_dependency "activesupport"
end
