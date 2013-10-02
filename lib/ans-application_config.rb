require "ans-application_config/version"

module Ans
  module ApplicationConfig
    autoload :Config, "ans-application_config/config.rb"
    autoload :NilConfig, "ans-application_config/nil_config.rb"

    include ActiveSupport::Configurable

    configure do |config|
      config.root_scope = nil
    end

    def self.included(m)
      m.class.class_eval do
        define_method :config do
          unless @config
            config = Ans::ApplicationConfig.config
            @config = Config.new(config.root_scope || m.to_s.underscore)
          end
          @config
        end
      end
    end
  end
end
