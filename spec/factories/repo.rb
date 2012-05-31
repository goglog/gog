FactoryGirl.define do

  factory :repo, class: Grit::Repo do
    ignore do
      path '../gog_test_repo'
    end

    initialize_with { new(path) }
  end
end