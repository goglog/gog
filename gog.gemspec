# encoding: utf-8
require File.expand_path('../lib/gog/version', __FILE__)


Gem::Specification.new do |s|
  s.name = 'gog'
  s.version = Gog::VERSION

  s.add_dependency 'grit', '~> 2.5'
  s.add_development_dependency 'bundler', '~> 1.0'
  s.authors = ['Thomas Darde']
  s.description = %q{A git changelog utility}
  s.email = 'gog@rougecardinal.fr'
  s.executables = `git ls-files -- bin/*`.split("\n").map{|f| File.basename(f)}
  s.extra_rdoc_files = ['README.md']
  s.files = `git ls-files`.split("\n")
  s.homepage = 'http://github.com/goglog/gog'
  s.rdoc_options = ['--charset=UTF-8']
  s.require_paths = ['lib']
  s.required_rubygems_version = Gem::Requirement.new('>= 1.3.6')
  s.summary = s.description
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
end