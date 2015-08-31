# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'typeform/version'

Gem::Specification.new do |spec|
  spec.name          = "typeform-ruby"
  spec.version       = Typeform::VERSION
  spec.authors       = ["Kentaro Takiguchi"]
  spec.email         = ["kentaro-takiguchi@cookpad.com"]

  spec.summary       = "Typeform I/O client for Ruby"
  spec.description   = "Simple wrapper for the Typeform I/O"
  spec.homepage      = "https://github.com/rejasupotaro/typeform-ruby"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rspec-json_matcher"

  spec.add_dependency "faraday"
  spec.add_dependency "faraday_middleware"
  spec.add_dependency "json-encodable"
end
