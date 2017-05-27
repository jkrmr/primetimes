# frozen_string_literal: true
require "primetimes/primality"

module Primetimes
  class PrimesTable
    attr_reader :products, :primes
    attr_accessor :max_product

    def initialize(n:)
      @primes = n.primes
      @max_product = 0
    end

    # Compute the number of digits in the greatest product
    def max_product_length
      max_product.to_s.length
    end

    def to_a
      @table ||= _table
    end

    private

    # Build a table of products from the list of primes,
    # Then add the list of primes as a header column and header row
    def _table
      rows = _inner_table(primes)

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
    # Side effect: Store the maximum product encountered as the max_product
    #              property
    #
    # Complexity: Quadratic
    #
    # Example:
    #   In: [2, 3, 5, 7]
    #
    #   Out: [[ 4,  6, 10, 14],
    #         [ 6,  9, 15, 21],
    #         [10, 15, 25, 35],
    #         [14, 21, 35, 49]]
    #
    def _inner_table(list)
      list.map do |a|
        list.map do |b|
          product = a * b

          if product > max_product
            self.max_product = product
          end

          product
        end
      end
    end
  end
end
