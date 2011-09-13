require 'tilt'

module Tilt
  class JavaScriptTemplate < Template
    self.default_mime_type = 'application/javascript'

    @@default_minify = false

    def self.default_minify
      @@default_minify
    end

    def self.default_minify=(value)
      @@default_minify = value
    end

    def self.engine_initialized?
      defined? ::Closure
    end

    def initialize_engine
      require_template_library 'closure-compiler'
    end

    def prepare
      unless options.include?(:minify)
        options[:minify] = self.class.default_minify
      end
    end

    def evaluate(scope, locals, &block)
      return data unless options[:minify]
      @output ||= ::Closure::Compiler.new.compile(data)
    end
  end
end
Tilt.register 'js', Tilt::JavaScriptTemplate
