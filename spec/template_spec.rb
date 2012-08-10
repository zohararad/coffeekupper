require 'spec_helper'
require 'v8'
require 'execjs'

describe Coffeekupper::Template do
  def template ck, file
    Coffeekupper::Template.new(file) { ck }
  end

  def render ck, file = "file.jst.ck"
    template(ck, file).render
  end

  it 'should have default mime type' do
    Coffeekupper::Template.default_mime_type.should == 'application/javascript'
  end

  describe 'rendering' do

    let(:ck_file) { 'hello.jst.coffeekup' }
    let(:ck_template) { File.read(File.join(File.dirname(__FILE__),'support','templates',ck_file)) }

    subject { render(ck_template, ck_file) }

    it { should include "function(locals){" }
  end

  describe 'executing' do
    subject do
      vendor_dir = File.expand_path('../../vendor/assets/javascripts',__FILE__)
      func = render "p -> 'Hello World'", 'hello.js.coffeekup'
      V8::C::Locker() do
        context = V8::Context.new
        context.eval(File.read(File.join(vendor_dir,'coffee-script.js')))
        context.eval(File.read(File.join(vendor_dir,'coffeekup.js')))
        context.eval("var CoffeeKup = coffeekup;\n var f = #{func};\n f()")
      end
    end

    it { should include 'Hello World' }
  end

  describe 'serving' do

    context 'assets' do

      before do
        begin
          Rails.application.assets.cache.clear
        rescue => e
        end
      end

      subject { assets }
      it { should serve 'sample.js' }
    end

  end

end