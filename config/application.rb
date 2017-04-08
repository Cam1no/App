require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Denken3
  class Application < Rails::Application
    config.generators do |g|
      g.stylesheets true
      g.javascripts false
      g.helper false
      g.template_engine :slim
      g.test_framework :rspec, view_specs: false, helper_specs: false, fixture: true
      g.fixture_replacement :factory_girl, dir: "spec/support/factories"
    end
    config.sass.preferred_syntax = :sass

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
