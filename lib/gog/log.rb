require 'grit'

class Gog
  module Log
    include Grit

    @@repo

    class << self


      def init(repo = Grit::Repo.new('.'))
        @@repo = repo
        @@changes = @@repo.commits('master', 30).map do |commit|
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
        reversed_tags = Hash.new {|h,k| h[k] = [] }
        tags = Hash.new
        # Grouping changes by parent tags (impossible in the other way with Grit)
        @@changes.each do |change|
          tag_name = change.closest_parent_tag_name
          reversed_tags[tag_name] << change
        end

        # Reversing tag array
        tags_array = reversed_tags.to_a
        tags_array.each_with_index do |tag_and_changes, index|
          tag = tag_and_changes[0]
          changes = tag_and_changes[1]
          new_tag = index > 0 ? tags_array[index - 1][0] : 'Unreleased'
          tags[new_tag] = changes
        end
        tags
      end

      def to_s
        if @@changes.empty?
          'No changes found. Read https://github.com/goglog/gog for instructions.'
        else
          @@changes.join "\n"
        end
      end

      def repo_tags
        @@tags ||= @@repo.tags.sort {|a,b| a.name <=> b.name }
      end

    end
  end
end
