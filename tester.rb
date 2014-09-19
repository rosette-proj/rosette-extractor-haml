require 'rosette/extractors/haml-extractor'

contents = File.read('/Users/cameron/workspace/beacon/app/views/about/overviews/show.html.haml')
# contents = '= if foo'
# parser = Haml::Parser.new(contents, Haml::Options.defaults)
# puts parser.parse.inspect

extractor = Rosette::Extractors::HamlExtractor::RailsExtractor.new
# lines = extractor.extract_ruby(extractor.parse(File.read('/Users/cameron/workspace/beacon/app/views/about/overviews/show.html.haml')))
# puts lines.join("\n")

extractor.extract_each_from(contents) do |phrase|
  puts phrase.key
end
