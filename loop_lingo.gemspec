# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'loop_lingo/version'

Gem::Specification.new do |spec|
  spec.name          = "loop_lingo"
  spec.version       = LoopLingo::VERSION
  spec.authors       = ["Matthew Nielsen"]
  spec.email         = ["xunker@pyxidis.org"]
  spec.description   = %q{Connect to Loop Lingo mechant API}
  spec.summary       = %q{Connect to Loop Lingo mechant API}
  spec.homepage      = "http://github.com/deseretbook/loop_lingo"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'httparty', '~>0.11.0'
  spec.add_dependency 'multi_json', '~>1.7.7'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10.1.0"
  spec.add_development_dependency 'rspec', '2.14.0'
  spec.add_development_dependency 'rspec-must', '0.0.1'
  spec.add_development_dependency 'debugger'
end
