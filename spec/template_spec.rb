require 'spec_helper'

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

  describe 'serving' do
    subject { assets }
    it { should serve 'sample.js' }
  end

end