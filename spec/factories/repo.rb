FactoryGirl.define do

  factory :repo, class: Grit::Repo do
    ignore do
      path (File.dirname(__FILE__) + '/../gog_test_repo')
    end

    initialize_with { new(path) }
  end
end