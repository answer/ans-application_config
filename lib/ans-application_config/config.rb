module Ans::ApplicationConfig
  class Config
    include Enumerable

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
      ::I18n.translate!(key, scope: @scope).tap{|value|
        case value
        when Hash
          break Config.new("#{@scope}.#{key}")
        end
      }
    rescue ::I18n::MissingTranslationData
      NilConfig.instance
    end

    def each(&block)
      case value = ::I18n.translate!(@scope)
      when Enumerable
        value.each(&block)
      end
    rescue ::I18n::MissingTranslationData
    end

    def inspect
      ::I18n.translate(@scope)
    end
  end
end
