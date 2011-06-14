    bundle install
    rackup config.ru -s thin -E production
    open http://127.0.0.1:9292/
    ruby publish.rb 'Hello world'

