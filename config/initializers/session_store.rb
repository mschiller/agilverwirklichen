Rails.application.config do |config|
  config.session_store :redis_store,
                       servers: ["#{Figaro.env.redis_store_url}/0/session"],
                       expire_after: 2.weeks,
                       key: "_#{Rails.application.class.parent_name.downcase}_session",
                       threadsafe: false
  config.middleware.use ActionDispatch::Session::RedisStore, {
      servers: ["#{Figaro.env.redis_store_url}/0/session"],
      :expire_after => 2.weeks,
      key: "_#{Rails.application.class.parent_name.downcase}_session",
      :threadsafe => false}
end