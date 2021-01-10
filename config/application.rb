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
    config.hosts << "8ea3249a3102.ngrok.io"
    
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
