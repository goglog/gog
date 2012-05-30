require 'grit'

class Gog
  class << self
    def version
      require 'gog/version'
      "Gog #{Gog::VERSION}"
    end
  end
end
