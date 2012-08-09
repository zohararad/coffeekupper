require 'tilt/template'

module Coffeekupper

  class Template < Tilt::Template

    self.default_mime_type = 'application/javascript'

    def prepare
    end

    def evaluate(scope, locals, &block)
    end

  end
end