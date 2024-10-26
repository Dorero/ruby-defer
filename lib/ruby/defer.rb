# frozen_string_literal: true

require_relative "defer/version"

module Kernel
  def with_defer
    deferred = []
    yield(deferred)
  ensure
    deferred.reverse_each(&:call)
  end
end