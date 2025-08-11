require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ChatPersonal
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
# Configuration update 106: Mon Aug 11 10:18:52 IST 2025
# Configuration update 112: Mon Aug 11 10:18:52 IST 2025
# Configuration update 118: Mon Aug 11 10:18:53 IST 2025
# Configuration update 124: Mon Aug 11 10:18:53 IST 2025
# Configuration update 130: Mon Aug 11 10:18:54 IST 2025
# Configuration update 136: Mon Aug 11 10:18:54 IST 2025
# Configuration update 142: Mon Aug 11 10:18:55 IST 2025
# Configuration update 148: Mon Aug 11 10:18:55 IST 2025
# Configuration update 154: Mon Aug 11 10:18:56 IST 2025
# Configuration update 160: Mon Aug 11 10:18:56 IST 2025
# Configuration update 166: Mon Aug 11 10:18:57 IST 2025
