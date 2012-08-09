module Coffeekupper

  class Engine < Rails::Engine

    initializer "coffeekupper.configure_rails_initialization", :before => 'sprockets.environment', :group => :all do |app|
      next unless app.config.assets.enabled

      require 'sprockets'
      require 'sprockets/engines'
      require 'coffeekupper/template'
      Sprockets.register_engine '.coffeekup', ::Coffeekupper::Template
      Sprockets.register_engine '.ck', ::Coffeekupper::Template
    end

  end

end