require_relative 'boot'
require 'neo4j/railtie'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MyApp
  class Application < Rails::Application

    config.generators do |g|
      g.orm             :neo4j
    end

    # Configure where to connect to the Neo4j DB
    # Note that embedded db is only available for JRuby
    # config.neo4j.session.type = :http
    # config.neo4j.session.url = 'http://localhost:7475'
    config.neo4j.session.url = 'http://172.16.19.89:4811'

    #  or
    # config.neo4j.session.type = :bolt
    # config.neo4j.session.url = 'bolt://172.16.19.89:7687'
    #  or
    # config.neo4j.session.type = :embeddedr
    # config.neo4j.session.path = Rails.root.join('neo4j-db').to_s

    # config.neo4j.session.url = 'http://neo4j:password@localhost:7475'
    config.neo4j.session.url = 'http://neo4j:password@172.16.19.89:4811'

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
