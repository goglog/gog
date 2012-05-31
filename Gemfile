source 'https://rubygems.org'

gemspec

platforms :mri_18 do
  gem 'ruby-debug', '>= 0.10.3'
end

platforms :mri_19 do
  gem 'ruby-debug19'
end

group :development do
  gem 'pry'
end

group :test do
  gem 'guard'
  gem 'rspec'
  gem 'guard-rspec'
  gem 'factory_girl', "~> 3.0"
end