path = File.expand_path "../", __FILE__

require 'sinatra'
require "#{path}/kpdotorg"

run Sinatra::Application