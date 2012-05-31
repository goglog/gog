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
    
    def self.changes_by_tag
      tags = Hash.new()
      @@commit_changes.each do |change|
        tag_name = change.closest_tag.name
        tags[tag_name] = [] unless tags[tag_name]
        tags[tag_name] << change
      end
      tags
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
