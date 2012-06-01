class Gog
  class Change

    attr_accessor :header, :message, :commit

    def initialize(header, message, commit)
      @header = header
      @message = message
      @commit = commit
    end

    def closest_tag
      @closest_tag ||= find_closest_tag
    end

    def to_s
      "#{@header}: #{message}"
    end

    private

    def find_closest_tag
      available_tags = Gog::Log.repo_tags
      return if available_tags.empty?

      available_tags_by_sha = {}
      available_tags.each do |tag|
        available_tags_by_sha[tag.commit.sha] = tag
      end

      Change.find_tag_in_self_or_parents(self, available_tags_by_sha)
    end

    def self.find_tag_in_self_or_parents(change, tags)
      tag = tags[change.commit.sha]
      tag || find_tag_in_self_or_parents(change.parents.first, tags)
    end

  end
end
