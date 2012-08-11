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

    # Splits a CoffeeKup template into lines joined by "+" sign
    # so the template text can be properly fed into the CoffeeKup compiler as a
    # concatenation of Javascript strings
    # @param [String] template the template to split
    # @return [String] split template as concatenation of Javascript strings
    def template_as_string(template)
      template.split("\n").collect{|line| '"' + line.gsub(/\"/,'\\"') + '"' }.join('+'+'"\n"'+'+')
    end

  end
end
