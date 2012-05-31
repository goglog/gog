class Gog
  class Change

    attr_accessor :header, :message, :commit
    
    def initialize(header, message, commit)
      @header = header
      @message = message
      @commit = commit
    end    
    
    def to_s
      "#{@header}: #{message}"
    end
  end
end
