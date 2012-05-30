require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Gog::Commit do

  describe "extract_changes" do
    context "no change" do
      let(:commit) { FactoryGirl.build(:commit) }
      it "finds a change" do
        changes = Gog::Commit.extract_changes(commit)
        changes.should be_empty
      end
    end
    
    context "one change" do
      let(:commit_with_one_line_change) { FactoryGirl.build(:commit_with_one_line_change) }
      it "finds a change" do
        changes = Gog::Commit.extract_changes(commit_with_one_line_change)
        change = changes.first
        change.header.should eq('Feature')
        change.message.should eq('yes')
      end
    end
    
    context "two changes" do
      let(:commit_with_two_one_line_changes) { FactoryGirl.build(:commit_with_two_one_line_changes) }
      it "finds a change" do
        changes = Gog::Commit.extract_changes(commit_with_two_one_line_changes)
        changes.size.should eq(2)
        change = changes.last
        change.header.should eq('Feature')
        change.message.should eq('also yes')
      end
    end
  end

end