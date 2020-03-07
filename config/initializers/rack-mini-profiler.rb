if defined? Rack::MiniProfiler
  #Rack::MiniProfiler.config.start_hidden = true
  #Rack::MiniProfiler.config.position = 'bottom-right'
  #Rack::MiniProfiler.config.disable_caching = false # defaults to true

  uri = URI.parse(Figaro.env.redis_store_url)
  Rack::MiniProfiler.config.storage_options = {:host => uri.host, :port => uri.port, :password => uri.password}
  Rack::MiniProfiler.config.storage = Rack::MiniProfiler::RedisStore
end