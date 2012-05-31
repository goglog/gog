FactoryGirl.define do

  factory :commit, class: Grit::Commit do
    ignore do
      repo { stubbed_repo }
      id "2"
      parents ["3"]
      tree "4"
      author "Thomeas"
      authored_date Time.now
      committer "Thomas"
      committed_date Time.now
      message ["HEllog "]
    end

    initialize_with { new(repo, id, parents, tree, author, authored_date, committer, committed_date, message) }

    factory :commit_with_one_line_change do
      message ["Hello\n%Feature yes"]
    end

    factory :commit_with_two_one_line_changes do
      message ["Hello\n%Feature yes\n%Feature also yes"]
    end
  end


end

def stubbed_repo
  repo = RSpec::Mocks::Mock.new('repo')
  repo.stub(:tags) { [] }
  repo.stub(:commits) { [] }
  Gog::Log.init repo
  repo
end

