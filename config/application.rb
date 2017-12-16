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
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.assets.enabled = true
    config.i18n.available_locales = %i[ru]
    config.i18n.default_locale = :ru
  end
end
