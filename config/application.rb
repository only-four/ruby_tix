require_relative 'boot'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RubyTix
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.hosts << "rubytix.herokuapp.com"
    config.hosts << "rubytix.space"
    config.hosts << "www.rubytix.space"
    config.hosts << "damp-cove-37711.herokuapp.com"
    config.hosts << "rubytix.fun"
    config.hosts << "www.rubytix.fun"
    config.hosts << "damp-crag-35739.herokuapp.com"
    config.hosts << "rubytix.com"
    config.hosts << "www.rubytix.com"
    config.hosts << "infinite-scrubland-08013.herokuapp.com"
    # config.hosts << "3e65b8a5297f.ngrok.io"
    config.time_zone = "Taipei"
    config.i18n.default_locale = "zh-TW"
    config.assets.initialize_on_precompile = false
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
