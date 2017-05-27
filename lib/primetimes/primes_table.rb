# frozen_string_literal: true
require "primetimes/primality"

module Primetimes
  class PrimesTable
    attr_reader :products, :primes
    attr_accessor :max_product

    def initialize(n:)
      @primes = n.primes
    end

    # Compute the number of digits in the greatest product
    def max_product_length
      (primes.last**2).to_s.length
    end

    def to_a
      @table ||= _table
    end

    private

    def _table
      rows = _inner_table

      # add header column of the list of primes
      primes.zip(rows).each do |prime, products|
        products.unshift(prime)
      end

      # add header row of the list of primes
      rows.unshift(primes.unshift(nil))
    end

    # Map a list of primes to a list of lists, each list being a list of
    # products of primes.
    #
    # Example:
    #   In: [2, 3, 5, 7]
    #
    #   Out: [[ 4,  6, 10, 14],
    #         [ 6,  9, 15, 21],
    #         [10, 15, 25, 35],
    #         [14, 21, 35, 49]]
    #
    def _inner_table
      primes.map do |prime_a|
        primes.map { |prime_b| prime_a * prime_b }
      end
    end
  end
end
