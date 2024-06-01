require 'sidekiq/web'

Sidekiq.configure_server do |config|
  config.redis = { url: ENV.fetch('REDIS_URL', 'redis://localhost:6379/1'),
                   network_timeout: 5,
                   pool_timeout: 5,
                   reconnect_attempts: 3 }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV.fetch('REDIS_URL', 'redis://localhost:6379/1'),
                   network_timeout: 5,
                   pool_timeout: 5,
                   reconnect_attempts: 3 }
end

Sidekiq.strict_args!(false)
