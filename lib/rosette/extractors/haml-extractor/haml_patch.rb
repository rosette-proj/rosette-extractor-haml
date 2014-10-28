# encoding: UTF-8

module Haml
  class Parser
    original_verbosity = $VERBOSE
    $VERBOSE = nil

    # Patch keywords until https://github.com/haml/haml/pull/802
    # and/or https://github.com/haml/haml/pull/803 get merged.
    # Total hack. Don't try this at home, kids.
    START_BLOCK_KEYWORDS = %w[if begin case unless while until]
    START_BLOCK_KEYWORD_REGEX = /(?:\w+(?:,\s*\w+)*\s*=\s*)?(#{START_BLOCK_KEYWORDS.join('|')})/
    BLOCK_KEYWORD_REGEX = /^-?\s*(?:(#{MID_BLOCK_KEYWORDS.join('|')})|#{START_BLOCK_KEYWORD_REGEX.source})\b/

    $VERBOSE = original_verbosity
  end
end
