require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Gog do

  describe "version" do
    it "shows version" do
      Gog.version.should eq("Gog #{Gog::VERSION}")
    end
  end
  
end