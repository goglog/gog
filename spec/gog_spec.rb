require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Gog do
  describe "version" do
    it "shows version" do
      require File.expand_path('../../lib/gog/version', __FILE__)
      Gog.version.should eq("Gog #{Gog::VERSION}")
    end
  end
  
end