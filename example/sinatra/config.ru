require 'logger'
require 'rack-config_env'
require_relative 'app'

logger = ::Logger.new(STDOUT)
def logger.write(msg)
  self.info msg.chomp!
end

use Rack::ConfigEnv, 'rack.errors' => logger
use Rack::CommonLogger
run App
