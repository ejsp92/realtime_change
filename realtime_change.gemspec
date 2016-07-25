# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'realtime_change/version'

Gem::Specification.new do |spec|
  spec.name          = "realtime_change"
  spec.version       = RealtimeChange::VERSION
  spec.authors       = ["Emeson Santana"]
  spec.email         = ["emesonsantana@gmail.com"]

  spec.summary       = %q{Gem for realtime client-server communication. Created to work with communication-socket node.js application (https://github.com/emesonsantana/communication-socket).}
  spec.description   = %q{Gem for realtime client-server communication. Created to work with communication-socket node.js application (https://github.com/emesonsantana/communication-socket).}
  spec.homepage      = "https://github.com/emesonsantana/realtime_change"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "redis", "~> 3.3"
  spec.add_development_dependency "activesupport", '>= 4.2.0'
  spec.add_development_dependency "rspec", "~> 3.2"
end
