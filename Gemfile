source "https://rubygems.org"

gemspec

ruby '2.0.0', engine: 'jruby', engine_version: '1.7.15'

# eventually turn these into dependencies in the gemspec
gem 'rosette-core', github: 'rosette-proj/rosette-core'
gem 'rosette-extractor-rb', github: 'rosette-proj/rosette-extractor-rb'

group :development, :test do
  gem 'pry-nav'
  gem 'rake'
end

group :test do
  gem 'codeclimate-test-reporter', require: nil
  gem 'rspec'
end
