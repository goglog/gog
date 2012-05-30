require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Gog::Commit do

  describe "extract_changes" do
    let(:commit) {FactoryGirl.build(:commit, message: ["Hello\n%Feature yes"])}
    it "finds a change" do
      change = Gog::Commit.extract_changes(commit)
      change.header.should eq('Feature')
      change.message.should eq('yes')
    end
  end

end