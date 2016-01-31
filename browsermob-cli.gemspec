# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'browsermob/cli/version'

Gem::Specification.new do |spec|
  spec.name          = 'browsermob-cli'
  spec.version       = BrowserMob::CLI::VERSION
  spec.authors       = ['Shashikant86']
  spec.email         = ['shashikant.jagtap@aol.co.uk']
  spec.summary       = 'BrowserMob Proxy CLI to Generate HAR and Capture Traffic'
  spec.description   = 'This Rubygem is CLI interface to check network traffic using HAR. It will generate HAR file preview in browser and YAML'
  spec.homepage      = "https://github.com/Shashikant86/browsermob-cli"
  spec.license       = 'MIT'
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency "thor", '~> 0'
  spec.add_development_dependency 'bundler', '~> 0'
  spec.add_development_dependency 'rake', '~> 0'
  spec.add_development_dependency 'rspec', '~> 0'
  spec.add_development_dependency 'selenium-webdriver', '~> 0'
  spec.add_development_dependency 'capybara', '~> 0'
  spec.add_development_dependency 'poltergeist', '~> 0'
  spec.add_development_dependency 'browsermob-proxy', '~> 0'
  spec.add_development_dependency 'webrick', '~> 0'
  spec.add_development_dependency 'launchy', '~> 0'
  spec.add_runtime_dependency 'addressable', '~> 0'
end
