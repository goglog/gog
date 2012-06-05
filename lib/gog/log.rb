require 'grit'

class Gog
  module Log
    include Grit

    @@repo

    class << self

      def init(repo = Grit::Repo.new("."))
        @@repo = repo
        @@changes = @@repo.commits.map do |commit|
          Gog::Commit.extract_changes commit
        end
        @@changes.select! { |change| !change.empty? }
        @@changes.flatten!
        self
      end

      def changes
        @@changes
      end

      def changes_by_tag
        tags = Hash.new()
        @@changes.each do |change|
          tag_name = change.closest_tag.name
          tags[tag_name] = [] unless tags[tag_name]
          tags[tag_name] << change
        end
        tags
      end

      def to_s
        if @@changes.empty?
          'No changes found. Read https://github.com/goglog/gog for instructions.'
        else
          @@changes.join("\n")
        end
      end

      def repo_tags
        @@tags ||= @@repo.tags.sort {|a,b| a.name <=> b.name }
      end

    end
  end
end
