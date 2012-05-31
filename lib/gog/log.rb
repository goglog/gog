require 'grit'

class Gog
  class Log
    include Grit

    @@repo
    
    def self.init(repo = Repo.new("."))
      @@repo = repo
      @@commit_changes = @@repo.commits.map do |commit|
        Gog::Commit.extract_changes commit
      end
      @@commit_changes.select! { |change| !change.empty? }
      @@commit_changes.flatten!
      self
    end
    
    def self.changes
      @@commit_changes
    end
    
    def self.to_s
      if @@commit_changes.empty?
        'No changes found. Read https://github.com/goglog/gog for instructions.'
      else
        @@commit_changes.join("\n")
      end
    end
    
    def self.repo_tags
      @@tags ||= @@repo.tags
    end
    
  end
end
