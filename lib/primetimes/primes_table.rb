# frozen_string_literal: true
require "primetimes/primality"

module Primetimes
  class PrimesTable
    attr_reader :products, :primes
    attr_accessor :max_product

    def initialize(n:)
      @products = {}
      @primes = n.primes
      @max_product = 0
    end

    def max_product_length
      max_product.to_s.length
    end

    def to_a
      @table ||= _table
    end

    private

    def _table
      rows = _inner_table

      # add left-header column of the list of primes
      primes.zip(rows).each do |prime, products|
        products.unshift(prime)
      end

      # add top-header row of the list of primes
      rows.unshift(primes.unshift(nil))
    end

    # Map a list of primes to a list of lists, each list being a list of
    # products of primes. Products are cached in the `products` hash table.
    #
    # Side Effect:
    #   Set the maximum product encountered as a property (`max_product`) on the
    #   object.
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
        primes.map do |prime_b|
          tuple = [prime_a, prime_b].sort

          if products[tuple].nil?
            products[tuple] = prime_a * prime_b
          end

          if products[tuple] > max_product
            self.max_product = products[tuple]
          end

          products[tuple]
        end
      end
    end
  end
end
