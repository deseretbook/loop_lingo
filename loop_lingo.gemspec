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

  if RUBY_VERSION == '1.8.7'
    # versioj 0.11.0 is the last version that works with 1.8.7
    spec.add_dependency 'httparty', '>=0.10.0', '<=0.11.0'  
  else
    spec.add_dependency 'httparty', '~>0.13.0'
  end
  spec.add_dependency 'multi_json'

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec', '2.14.0'
  spec.add_development_dependency 'rspec-must'
end
