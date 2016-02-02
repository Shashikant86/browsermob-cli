require 'thor'
require 'browsermob/cli/version'
require 'browsermob/cli/browsermob'

module BrowserMob
  module CLI
    class Main < Thor
      include Thor::Actions

      map %w(-v -V --version) => :version

      desc 'setup', 'Get Browsermob Proxy from Internet'
      def setup
       bm = BrowserMobSetup.new
       bm.download_browsermob_proxy
      end

      desc 'version', 'Get the current version number'
      def version
        say BrowserMob::CLI::VERSION
      end

      desc 'show_har_click URL', 'Get list of all requests when clicked on Locator'
      option :locator
      def show_har_click(url)
        bm = BrowserMobSetup.new
        if options[:locator]
        bm.capture_traffic_with_click(url, "#{options[:locator]}")
        end
      end

      desc 'show_har URL', 'Get list of all requests'
      def show_har(url)
        bm = BrowserMobSetup.new
        bm.capture_traffic(url)
      end

      desc 'view_har_in_browser', 'Open up browser and Preview HAR file. Press Ctl+C Once DONE to stop WEBrick server'
      def view_har_in_browser
        bm = BrowserMobSetup.new
        bm.show_har_data_browser
      end

      desc 'view_har_in_YAML', 'Display HAR file in YML in your Editor'
      def view_har_in_YAML
        system("open /tmp/traffic.yml")
      end

      desc 'kill_port', 'Clear Port used by BrowserMob proxy'
      def port_clearance
        system('kill -9 $(lsof -i tcp:7676 -t)')
      end
    end
  end
end
