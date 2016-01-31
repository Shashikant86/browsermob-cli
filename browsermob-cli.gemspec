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
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency "thor", '~> 0.17.0'
  spec.add_development_dependency 'bundler', '~> 1.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'selenium-webdriver', '~> 2.40.0'
  spec.add_development_dependency 'capybara', '~> 2.1', '>= 2.6.2'
  spec.add_development_dependency 'poltergeist', '~> 1.5.1'
  spec.add_development_dependency 'browsermob-proxy', '~> 0.1.8'
  spec.add_development_dependency 'webrick'
  spec.add_development_dependency 'launchy', '~> 2.0', '>= 2.4.3'
  spec.add_runtime_dependency 'addressable', '~> 2.3', '>= 2.4.0'
end
