require 'gog/change'

ONE_LINE_ONE_WORD_REGEX = /^\%([^\s]+)\s(.*)$/

class Gog
  module Commit

    def self.extract_changes(commit)
      message = commit.message
      matched = message.scan(ONE_LINE_ONE_WORD_REGEX)
      return [] if matched.empty?
      matched.map do |match|
        Gog::Change.new match[0], match[1], commit
      end
    end

  end
end
