require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Gog::Log do

  describe "Showing log" do
    context "stubbed_repos" do
      context "no change" do
        let(:repo) { stubbed_empty_repo }

        it "shows empty changelog" do
          log = Gog::Log.init repo
          log.to_s.should eq("No changes found. Read https://github.com/goglog/gog for instructions.")
        end
      end

      context "changes" do
        let(:repo) { stubbed_repo }

        it "shows empty changelog" do
          log = Gog::Log.init repo
          log.to_s.should eq("Feature: yes\nFeature: also yes")
        end
      end
    end
    
    context "submodule repo" do
      context "tags" do
        let(:repo) { FactoryGirl.build(:repo) }

        it "shows first tags" do
          log = Gog::Log.init repo
          Gog::Log.repo_tags.first.name.should eq('0.0.1')
          Gog::Log.repo_tags[1].name.should eq('0.0.2')
        end
      end
      
    end
  end

  private
  
  def stubbed_empty_repo
    repo = double('repo')
    repo.stub(:commits){ [FactoryGirl.build(:commit)] }
    repo
  end

  def stubbed_repo
    repo = double('repo')
    repo.stub(:commits){ [FactoryGirl.build(:commit_with_two_one_line_changes)] }
    repo
  end

end