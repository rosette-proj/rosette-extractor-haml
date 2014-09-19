# encoding: UTF-8

require 'haml'
require 'rosette/extractors/ruby-extractor'
require 'rosette/extractors/haml-extractor/haml_patch'

module Rosette
  module Extractors

    class HamlExtractor < Rosette::Extractors::RubyExtractor
      protected

      def each_function_call(haml_code, &block)
        super(isolate_ruby(parse_haml(haml_code)).join(';'), &block)
      end

      private

      def parse_haml(haml_code)
        options = Haml::Options.new(Haml::Options.defaults)
        Haml::Parser.new(haml_code, options).parse
      end

      def isolate_ruby(node)
        first_line = case node.type
          when :silent_script, :script
            node.value[:text]
          when :tag
            node.value[:value]
        end

        lines = []
        lines << first_line if first_line

        lines += node.children.flat_map do |child|
          isolate_ruby(child)
        end

        if requires_end_statement?(first_line, node)
          lines << 'end'
        end

        lines
      end

      def requires_end_statement?(first_line, node)
        first_line && (node.value.fetch(:keyword, nil) || has_block?(first_line))
      end

      def has_block?(text)
        text.strip =~ /do[ |\w,]*\z/
      end

      class RailsExtractor < HamlExtractor
        protected

        def valid_name?(node)
          node.name == 't'
        end
      end

      class FastGettextExtractor < HamlExtractor
        protected

        def valid_name?(node)
          node.name == '_'
        end
      end
    end

  end
end
