require 'rubygems'
require 'faye'
require File.dirname(__FILE__) + '/app'

MAGIC_WORD = 'magic_word'

class AuthExtension
  def incoming(message, callback)
    unless message['channel'] == '/meta/subscribe'
      return callback.call(message)
    end
    
    unless message['ext'] and message['ext']['auth'] == MAGIC_WORD
      message['error'] = Faye::Error.channel_forbidden
    end
    
    callback.call(message)
  end
end

use Faye::RackAdapter,  :mount      => '/faye',
                        :timeout    => 25,
                        :extensions => [AuthExtension.new]

run Sinatra::Application

