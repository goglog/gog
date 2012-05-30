require 'grit'

class Gog
  class Log
    include Grit


    attr_accessor :changes

    def initialize
      repo = Repo.new(".")
      @commit_changes = repo.commits.map do |commit|
        Gog::Commit.extract_changes commit
      end
      @commit_changes.select! { |change| !change.empty? }
      @commit_changes.flatten!
      @commit_changes.sort_by! { |change| change.header }
    end

    def to_s
      @commit_changes.join("\n")
    end
  end
end
