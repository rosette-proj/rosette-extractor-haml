[![Build Status](https://travis-ci.org/rosette-proj/rosette-extractor-haml.svg)](https://travis-ci.org/rosette-proj/rosette-extractor-haml) [![Code Climate](https://codeclimate.com/github/rosette-proj/rosette-extractor-haml/badges/gpa.svg)](https://codeclimate.com/github/rosette-proj/rosette-extractor-haml) [![Test Coverage](https://codeclimate.com/github/rosette-proj/rosette-extractor-haml/badges/coverage.svg)](https://codeclimate.com/github/rosette-proj/rosette-extractor-haml/coverage)

rosette-extractor-haml
====================

Extracts translatable strings from HAML source code for the Rosette internationalization platform.

## Installation

`gem install rosette-extractor-haml`

Then, somewhere in your project:

```ruby
require 'rosette/extractors/haml-extractor'
```

### Introduction

This library is generally meant to be used with the Rosette internationalization platform that extracts translatable phrases from git repositories. rosette-extractor-haml is capable of identifying translatable phrases in HAML source files, specifically those that use one of the following translation strategies:

1. The `t()` function in Rails templates via the [I18n gem](https://github.com/svenfuchs/i18n). Rails includes this gem by default.
2. The `_()` function via [fast_gettext](https://github.com/grosser/fast_gettext).

Additional types of function calls are straightforward to support. Open an issue or pull request if you'd like to see support for another strategy.

### Usage with rosette-server

Let's assume you're configuring an instance of [`Rosette::Server`](https://github.com/rosette-proj/rosette-server). Adding Rails template support would cause your configuration to look something like this:

```ruby
# config.ru
require 'rosette/core'
require 'rosette/extractors/haml-extractor'

rosette_config = Rosette.build_config do |config|
  config.add_repo('my_awesome_repo') do |repo_config|
    repo_config.add_extractor('haml/rails') do |extractor_config|
      extractor_config.match_file_extension('.html.haml')
    end
  end
end

server = Rosette::Server::ApiV1.new(rosette_config)
run server
```

See the documentation contained in [rosette-core](https://github.com/rosette-proj/rosette-core) for a complete list of extractor configuration options in addition to `match_file_extension`.

### Standalone Usage

While most of the time rosette-extractor-haml will probably be used alongside rosette-server (or similar), there may arise use cases where someone might want to use it on its own. The `extract_each_from` method on `RailsExtractor` yields `Rosette::Core::Phrase` objects (or returns an enumerator):

```ruby
haml_source_code = "%section#summary\n  %p.large= t('Foobar')"
extractor = Rosette::Extractors::HamlExtractor::RailsExtractor.new
extractor.extract_each_from(haml_source_code) do |phrase|
  phrase.key  # => "Foobar"
end
```

## Requirements

This project must be run under jRuby. It uses [expert](https://github.com/camertron/expert) to manage java dependencies via Maven. Run `bundle exec expert install` in the project root to download and install java dependencies.

## Running Tests

`bundle exec rake` or `bundle exec rspec` should do the trick.

## Authors

* Cameron C. Dutro: http://github.com/camertron
