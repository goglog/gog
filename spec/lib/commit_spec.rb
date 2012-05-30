require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Gog::Commit do

  describe "extract_changes" do
    context "one change" do
      let(:commit_with_one_line_change) {FactoryGirl.build(:commit_with_one_line_change)}
      it "finds a change" do
        change = Gog::Commit.extract_changes(commit_with_one_line_change)
        change.header.should eq('Feature')
        change.message.should eq('yes')
      end
    end
  end

end