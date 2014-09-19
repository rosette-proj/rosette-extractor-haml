# encoding: UTF-8

module Haml
  class Parser
    original_verbosity = $VERBOSE
    $VERBOSE = nil

    # Patch keywords until https://github.com/haml/haml/pull/802
    # and/or https://github.com/haml/haml/pull/803 get merged.
    START_BLOCK_KEYWORDS = %w[if begin case unless while until]

    $VERBOSE = original_verbosity
  end
end
