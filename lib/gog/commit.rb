require 'gog/change'

class Gog
  module Commit
    def self.extract_changes(commit)
      message = commit.message
      data = /\%([^\s]+)\s(.*)/.match(message)
      Gog::Change.new(data[1], data[2])      
    end
  end
end
