class Gog
  class Change

    attr_accessor :header, :message, :commit

    def initialize(header, message, commit)
      @header = header
      @message = message
      @commit = commit
    end

    def closest_parent_tag_name
      @closest_parent_tag_name ||= find_closest_parent_tag_name
    end

    def to_s
      "#{@header}: #{message}"
    end

    private

    def find_closest_parent_tag_name
      available_tags = Gog::Log.repo_tags
      return if available_tags.empty?

      available_tags_by_sha = {}
      available_tags.each do |tag|
        available_tags_by_sha[tag.commit.sha] = tag
      end

      Change.find_tag_name_in_self_or_parents(self.commit.parents, available_tags_by_sha)
    end

    def self.find_tag_name_in_self_or_parents(commits, tags)
      return '0.0.0' if commits.empty?
      commit = commits.first
      tag = tags[commit.sha]
      tag ? tag.name : find_tag_name_in_self_or_parents(commit.parents, tags)
    end
    
    
  end
end
