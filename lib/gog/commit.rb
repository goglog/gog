require 'gog/change'

class Gog
  module Commit
    def self.extract_changes(commit)
      message = commit.message
      matched = message.scan(/^\%([^\s]+)\s(.*)$/)
      return [] if matched.empty?
      matched.map do |match|
        Gog::Change.new(match[0], match[1])      
      end
    end
  end
end
