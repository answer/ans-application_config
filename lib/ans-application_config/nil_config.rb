module Ans::ApplicationConfig
  class NilConfig
    def self.instance
      @instance ||= new
    end

    def method_missing(method,*args)
      NilConfig.instance
    end

    def to_s
      ""
    end
  end
end
