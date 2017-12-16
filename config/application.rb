require_relative 'boot'

require 'rails/all'
Bundler.require(*Rails.groups)

module Agaff
  class Application < Rails::Application
    config.autoload_paths += Dir[
      "#{config.root}/lib/**/"
    ]
    config.load_defaults 5.1
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    config.assets.enabled = true
  end
end
