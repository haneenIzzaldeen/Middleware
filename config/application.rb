require_relative "boot"

# require_relative '../lib/my_middleware'
require_relative '../lib/delta_logger'
require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Middleware
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    # config.middleware.use MyMiddleware 
    # config.middleware.insert_before Rails::Rack::Logger, DeltaLogger
    # config.middleware.insert_after Rails::Rack::Logger, DeltaLogger
    config.middleware.use DeltaLogger
    # config.middleware.swap ActionDispatch::ParamsParser, MyParamsParser
    # config.middleware.insert_before "Rails::Rack::Logger", "MyMiddleware"
    # config.middleware.swap "ActionDispatch::ParamsParser", "MyParamsParser"
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
