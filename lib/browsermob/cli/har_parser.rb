require 'rubygems'
require 'addressable/uri'
require 'json'
require 'yaml'
require 'tempfile'
module BrowserMob
  module CLI
    class HarParser
      def initialize
        @harfile = File.open("/tmp/traffic.har")
      end

        def parse_har_file
        archive = nil
        begin
          archive = JSON.parse File.read(@harfile)
        rescue => err
          puts "could not pase archive file: #{err}"
          exit 1
        end
        entries = archive['log']['entries']
        hosts = entries.map do |entry|
          Addressable::URI.parse(entry['request']['url']).host
        end
        output = hosts.uniq.map do |host|
          urls = entries.map do |entry|
            next unless entry['request']['url'].match("http://#{host}/")
            {
              entry['request']['url'] => entry['timings']
            }
          end
          urls.reject!(&:nil?)
          { host => urls }
        end

        data = File.open("/tmp/traffic.yml", 'w')
        data << output.to_yaml
        # puts output.to_a
      end
    end
 end
end
