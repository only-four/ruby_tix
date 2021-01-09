require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RubyTix
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    # config.hosts << "www.rubytix.fun"
    # config.hosts << "warm-earth-15284.herokuapp.com"
    # config.hosts << "rocky-caverns-12313.herokuapp.com"
    # config.hosts << "b8fcb5b3c787.ngrok.io"
    
    config.hosts << "peaceful-forest-86679.herokuapp.com"
    config.time_zone = "Taipei"
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
