require 'grit'
require 'gog/commit'

class Gog
  class << self
    def version
      require 'gog/version'
      "Gog #{Gog::VERSION}"
    end
    
    def log
      require 'gog/log'
      Gog::Log.new
    end
    
    def help
      "to list a full changelog run:\n gog log"
    end
  end
end
