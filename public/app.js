var bayeux = new Faye.Client('/faye');

bayeux.addExtension({
  outgoing: function(message, callback) {
    if (message.channel !== '/meta/subscribe')
      return callback(message);
    
    jQuery.get('/auth_token', function(token) {
      message.ext = message.ext || {};
      message.ext.auth = token;
      callback(message);
    });
  }
});

var sub = bayeux.subscribe('/some/channel', function(message) {
  alert(message.text);
});

sub.errback(function(error) {
  alert(error.message);
});

