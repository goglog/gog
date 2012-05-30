FactoryGirl.define do
  factory :commit, class: Grit::Commit do
    ignore do
      repo "1"
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
  end
end
