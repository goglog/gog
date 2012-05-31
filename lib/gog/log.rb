require 'grit'

class Gog
  class Log
    include Grit

    def self.init(repo = Repo.new("."))
      @@commit_changes = repo.commits.map do |commit|
        Gog::Commit.extract_changes commit
      end
      @@commit_changes.select! { |change| !change.empty? }
      @@commit_changes.flatten!
      @@commit_changes.sort_by! { |change| change.header }
      self
    end
    
    def self.to_s
      if @@commit_changes.empty?
        'No changes found. Read https://github.com/goglog/gog for instructions.'
      else
        @@commit_changes.join("\n")
      end
    end
    
  end
end
