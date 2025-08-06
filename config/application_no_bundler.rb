require_relative "boot_no_bundler"

require "rails/all"

# Skip bundler requirement and manually require gems
require 'sqlite3'
require 'puma'
require 'sprockets/railtie'
require 'devise'
require 'simple_form'

module Shop
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
