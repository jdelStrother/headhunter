require 'headhunter'
require 'headhunter/rack/capturing_middleware'

module Headhunter
  module Rails
    class Railtie < ::Rails::Railtie
      initializer "headhunter.hijack" do |app|
        head_hunter = Runner.new(app)
        Headhunter.runner = head_hunter
        app.middleware.insert(0, Headhunter::Rack::CapturingMiddleware, head_hunter)
      end
    end
  end
end
