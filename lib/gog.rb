require 'grit'
require 'gog/commit'
require 'gog/log'

class Gog
  class << self
    def version
      require 'gog/version'
      "Gog #{Gog::VERSION}"
    end
    
    def log
      require 'gog/log'
      Gog::Log.init
    end
    
    def help
      "to list a full changelog run:\n gog log"
    end
  end
end
