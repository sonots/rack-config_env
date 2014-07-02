module Rack
  class ConfigEnv
    def initialize(app, opts = {})
      @app = app
      @opts = opts
    end

    def call(env)
      env.merge!(@opts)
      @app.call(env)
    end
  end
end
