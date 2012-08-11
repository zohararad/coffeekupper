require 'tilt/template'

module Coffeekupper

  class Template < Tilt::Template

    self.default_mime_type = 'application/javascript'

    def prepare
    end

    def evaluate(scope, locals, &block)
      %( (function(){ var tmpl = #{template_as_string(data)}; return CoffeeKup.compile(tmpl) })() )
    end

    private

    def template_as_string(template)
      template.split("\n").collect{|line| '"' + line.gsub(/\"/,'\\"') + '"' }.join('+'+'"\n"'+'+')
    end

  end
end
