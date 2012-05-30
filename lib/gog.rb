require 'grit'
require 'gog/commit'

class Gog
  class << self
    def version
      require 'gog/version'
      "Gog #{Gog::VERSION}"
    end
  end
end
