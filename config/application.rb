require_relative 'boot'

require 'rails/all'

# Ruby 3.1+ compatibility: Enable YAML aliases for Psych 4.0+
if Psych::VERSION >= '4.0'
  module Psych
    class << self
      alias_method :load_without_aliases, :load

      def load(yaml, *args)
        if args.empty?
          load_without_aliases(yaml, aliases: true)
        else
          load_without_aliases(yaml, *args)
        end
      end
    end
  end
end

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Yamanote
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
