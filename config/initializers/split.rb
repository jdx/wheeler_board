Split.redis = ENV['REDISTOGO_URL'] || 'localhost:6379'
Split.configure do |config|
  config.db_failover = true
  config.db_failover_on_db_error = proc{|error| Rails.logger.error(error.message) }
  config.enabled = true
end
