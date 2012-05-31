class Gog
  class Change

    attr_accessor :header, :message, :sha
    
    def initialize(header, message, sha)
      @header = header
      @message = message
      @sha = sha
    end    
    
    def to_s
      "#{@header}: #{message}"
    end
  end
end
