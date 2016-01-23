# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jp_station/version'

Gem::Specification.new do |spec|
  spec.name          = "jp_station"
  spec.version       = JpStation::VERSION
  spec.authors       = ["Takayoshi Nishida"]
  spec.email         = ["takayoshi.nishida@gmail.com"]

  spec.summary       = %q{Get the stations near the place in Japan.}
  spec.description   = %q{Get the stations near the place in Japan.}
  spec.homepage      = "https://github.com/takp/jp_station"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
