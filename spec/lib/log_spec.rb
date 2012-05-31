require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Gog::Log do

  describe "Showing log" do
    
    context "no commits" do
      context "no change" do
        let(:repo) { stubbed_repo }
        
        it "shows empty changelog" do
          log = Gog::Log.new repo
          log.to_s.should eq("No changes found. Read https://github.com/goglog/gog for instructions.")
        end
      end
    end
  end

  private
  
  def stubbed_repo
    repo = double('repo')
    repo.stub(:commits){ [FactoryGirl.build(:commit)] }
    repo
  end

end