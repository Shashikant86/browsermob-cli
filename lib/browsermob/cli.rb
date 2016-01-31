require "browsermob/cli/version"
require 'browsermob/cli/browsermob'
require 'browsermob/cli/main'
require 'browsermob/cli/har_parser'

module BrowserMob
  module CLI
    def check_file_locations
    $har = "/tmp/traffic.har"
    $binary = "/tmp/browsermob-proxy/bin/browsermob-proxy"
    end
  end
end
