require 'rubygems'
require 'net/http'
require 'uri'
require 'json'

endpoint = URI.parse('http://127.0.0.1:9292/faye')
message  = JSON.dump('channel' => '/some/channel', 'data' => {'text' => ARGV[0]})

Net::HTTP.post_form(endpoint, :message => message)

