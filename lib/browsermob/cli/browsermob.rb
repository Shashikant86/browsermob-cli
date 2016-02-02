require 'selenium-webdriver'
require 'browsermob/proxy'
require 'json'
require 'browsermob/cli/har_parser'
require "har"
require "webrick"
require "launchy"
require 'tempfile'
require 'fileutils'

module BrowserMob
  module CLI
    class BrowserMobSetup

      attr_accessor :url

      def initialize
        @url = url
      end

      def download_browsermob_proxy
        FileUtils.rm_rf('/tmp/browsermob-proxy') if Dir.exists?("/tmp/browsermob-proxy")
        system('cd /tmp && wget https://github.com/lightbody/browsermob-proxy/releases/download/browsermob-proxy-2.1.0-beta-4/browsermob-proxy-2.1.0-beta-4-bin.zip')
        system("cd /tmp && unzip browsermob-proxy-2.1.0-beta-4-bin.zip")
        system("mv /tmp/browsermob-proxy-2.1.0-beta-4 /tmp/browsermob-proxy/")
        system("chmod +x /tmp/browsermob-proxy/bin/browsermob-proxy")
      end

      def browsermob_setting
        binary = "/tmp/browsermob-proxy/bin/browsermob-proxy"
        server = BrowserMob::Proxy::Server.new(binary, port: 7676)
        server.start
        server.create_proxy
       end

      def firefox_profile_setup
        firefox_profile_setup = Selenium::WebDriver::Firefox::Profile.new
        firefox_profile_setup.proxy = @proxy.selenium_proxy
        firefox_profile_setup
      end

      def chrome_profile_setup
        proxy = Selenium::WebDriver::Proxy.new(:http => @proxy.selenium_proxy.http)
        @chrome_caps = Selenium::WebDriver::Remote::Capabilities.chrome(:proxy => proxy)
        @driver = Selenium::WebDriver.for(:chrome, :desired_capabilities => caps)
      end

      def setup
        File.delete("/tmp/traffic.har") if File.exist?("/tmp/traffic.har")
        File.delete("/tmp/traffic.yml") if File.exist?("/tmp/traffic.yml")
        @proxy = browsermob_setting
        @driver = Selenium::WebDriver.for :firefox, profile: firefox_profile_setup
        # @driver = Selenium::WebDriver.for(:chrome, :desired_capabilities => @chrome_caps)
      end

      def teardown
        @driver.quit
        @proxy.close
      end

      def convert_to_yml
       yml = HarParser.new
       yml.parse_har_file
      end

      def user_actions(url, options = {})
        if options.empty? == true
          @driver.get url
      else
      @driver.find_element(css: options[:source]).click
      sleep 2
      end
      end

      def show_har_data_browser
        exec("har /tmp/traffic.har")
      end

      def capture_traffic(url)
        setup
        @proxy.new_har "google"
        @driver.get url
        har = @proxy.har
        all_requests = Proc.new do
          har.entries.each do |entry|
          puts "=====Request URL======\n"
          puts entry.request.url
          end
        end
        all_requests.call
        @har_file = File.new("/tmp/traffic.har",  "w+")
        @proxy.new_har.save_to @har_file
        har.save_to @har_file
        teardown
        convert_to_yml
        show_har_data_browser
      end

      def capture_traffic_with_click(url, selector)
        setup
        @proxy.new_har "google"
        @driver.get url
        @driver.find_element(css: selector).click
        sleep 3
        har = @proxy.har
        all_requests = Proc.new do
          har.entries.each do |entry|
          puts "=====Request URL======\n"
          puts entry.request.url
          end
        end
        all_requests.call
        @har_file = File.new("/tmp/traffic.har",  "w+")
        @proxy.new_har.save_to @har_file
        har.save_to @har_file
        teardown
        convert_to_yml
        show_har_data_browser
      end
    end
  end
end
