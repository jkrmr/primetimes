# frozen_string_literal: true
require "primetimes/primality"

module Primetimes
  class PrimesTable
    attr_reader :products, :primes

    def initialize(n:)
      @products = {}
      @primes = n.primes
    end

    def table
      rows = primes.map do |prime_a|
        primes.map do |prime_b|
          tuple = [prime_a, prime_b].sort
          products[tuple] = prime_a * prime_b if products[tuple].nil?
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
