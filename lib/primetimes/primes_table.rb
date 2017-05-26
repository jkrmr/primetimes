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
      rows = primes.map do |prime_a|
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

      primes.zip(rows).each do |prime, products|
        products.unshift(prime)
      end

      rows.unshift(primes.unshift(nil))
    end
  end
end
