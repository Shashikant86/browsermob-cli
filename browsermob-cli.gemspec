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
  spec.homepage      = "No HomePage Yet."
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://nothing.com'"
  else
    fail 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency "thor"
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'selenium-webdriver'
  spec.add_development_dependency 'capybara'
  spec.add_development_dependency 'poltergeist'
  spec.add_development_dependency 'browsermob-proxy'
  spec.add_development_dependency 'webrick'
  spec.add_development_dependency 'launchy'
  spec.add_runtime_dependency 'addressable'
end
