require 'spec_helper'

describe BrowserMob::CLI do
  it 'has a version number' do
    expect(BrowserMob::CLI::VERSION).not_to be nil
  end
end
