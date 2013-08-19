module Ans::ApplicationConfig
  class Config
    def initialize(scope)
      @scope = scope
    end
    def method_missing(method,*args)
      value = self[method]
      self.class_eval do
        define_method method.to_sym do
          value
        end
      end
      value
    end
    def [](key)
      I18n.t(key, scope: @scope, default: nil).tap{|value|
        case value
        when Hash
          break Config.new("#{@scope}.#{key}")
        end
      }
    end
  end
end
