require_relative 'spec_helper'
require 'rack/mock'
require 'logger'

describe Rack::ConfigEnv do
  app = lambda { |env|
    [200, {'Content-Type' => 'text/plain'}, ["Hello, World!"]]
  }

  context 'conform to Rack::Lint' do
    subject do
      @env = { 'rack.logger' => Logger.new(STDOUT) }
      Rack::Lint.new( Rack::ConfigEnv.new(app, @env) )
    end

    it 'GET /get' do
      Rack::MockRequest.new(subject).get('/get')
    end
  end
end

