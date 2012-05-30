class Gog
  class Change

    attr_accessor :header
    attr_accessor :message
    
    def initialize(header, message)
      @header = header
      @message = message
    end    
    
    def to_s
      "#{@header}: #{message}"
    end
  end
end
