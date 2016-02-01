# BrowserMob CLI

BrowserMob CLI os Rubygem to generate HAR files from command line. This will preview HAR files in the Browser as well as parse it in YAML. It works well for FirefoxDriver and ChromeDriver/GhostDriver are WIP.

If you are new to HAR(HTTP Archive) & BrowserMob Proxy then please read these couple of links
* What is (HAR)[https://www.maxcdn.com/one/visual-glossary/har-file/]
* HAR (Spec)[http://www.softwareishard.com/blog/har-12-spec/]
* (BrowserMobProxy)[http://bmp.lightbody.net/]

HAR file can be used for
* Calculate Load time.
* Set/Get HTTP Headers during your tests
* Capture performance data with HAR files.
* Simulate network traffic and latency
* Rewrite HTTP requests and response

##BrowserMob CLI can do following things:

* Download Browsermobproxy programatically and save it in /tmp

* Genarate and Preview Har file from command line by passing URL

* Genarate and Preview Har file from command line by passing URL and adding user actions

* List out request urls


## Installation

Before we start, please make sure you got following packages installed

* wget
* Ruby > 1.9.3
* Bundler
* Install Har gem

          $ gem install har

Add this line to your application's Gemfile:

```ruby
gem 'browsermob-cli'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install browsermob-cli

## Usage

#### Download BrowserMob Proxy
Assuming that you don't have BrowserMob Proxy downloaded, then first thing we probaly need to download it and save it to your /tmp directory (Assuming /tmp has write access). Just run following command.

        $ browsermob-cli setup

Now, you should have browsermob-proxy binary downloaded in the /tmp directory itself.

#### Generate HAR file for any URL
We can generate HAR data for any url e.g (AOL website) by running

         $ browsermob-cli show_har http://www.aol.co.uk

After running this command, you should see following

* Firefox Opened up with AOL homepage within BrowserMob proxy
* All request URLS printed on console
* HAR file saved to /tmp/traffic.har
* HAR data parsed in YAML format and saved to /tmp/traffic.yml
* WEBrick server starts and open up HAR data to preview

#### Generate HAR file for any URL when user clicks on the page
We can generate HAR data for any url e.g (BBC website) and passing CSS Selector
where you want to click

         $ browsermob-cli show_har_click http://www.bbc.co.uk/blogs --locator ".rsp-img"

After running this command, you should see following

* Firefox Opened up with BBC blog homepage within BrowserMob proxy and clicked on image
* All request URLS printed on console
* HAR file saved to /tmp/traffic.har
* HAR data parsed in YAML format and saved to /tmp/traffic.yml
* WEBrick server starts and open up HAR data to preview

#### View YAML File Or Preview in Browser
You can view generated YAML file with HAR data.

        $ browsermob-cli view_har_in_YAML
        $ browsermob-cli view_har_in_browser
#### Usage command

        $ browsermob-cli
        Commands:
         browsermob-cli help [COMMAND]       # Describe available commands or one specific command
         browsermob-cli setup                # Get Browsermob Proxy from Internet
         browsermob-cli show_har URL         # Get list of all requests
         browsermob-cli show_har_click URL   # Get list of all requests when clicked on Locator
         browsermob-cli version              # Get the current version number
         browsermob-cli view_har_in_YAML     # Display HAR file in YML in your Editor
         browsermob-cli view_har_in_browser  # Open up browser and Preview HAR file. Press Ctl+C Once DONE...
