require "bundler/gem_tasks"
require "rspec/core/rake_task"
require 'uri'
require 'cgi'
require 'capybara'
require 'capybara/dsl'
require 'rspec'
require 'capybara/rspec'
require 'rspec/expectations'
require 'selenium/webdriver'
require 'browsermob/proxy'
require 'browsermob/proxy/webdriver_listener'
include RSpec::Matchers
require 'json'
require "har"
require "webrick"
require "launchy"
require 'tempfile'
require 'fileutils'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec
