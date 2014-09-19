# encoding: UTF-8

require 'spec_helper'

include Rosette::Extractors

describe HamlExtractor do
  FIXTURE_MANIFEST.each_pair do |extractor_name, expected_results|
    describe extractor_name do
      let(:extractor) do
        capitalized_name = Rosette::Core::StringUtils.camelize(extractor_name.to_s)
        HamlExtractor.const_get("#{capitalized_name}Extractor").new
      end

      expected_results.each_pair do |expected_file, expected_phrases|
        it "extracts phrases correctly from #{expected_file}" do
          source_file = File.join(FIXTURE_DIR, expected_file)

          extractor.extract_each_from(File.read(source_file)).each do |actual_phrase|
            expect(expected_phrases).to include(actual_phrase.key)
            expected_phrases.delete(actual_phrase.key)
          end

          expect(expected_phrases).to be_empty
        end
      end
    end
  end
end
