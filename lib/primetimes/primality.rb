# coding: utf-8
# frozen_string_literal: true

module Primetimes
  module Primality
    # Predicate: Is the receiver prime?
    # Algorithm: Optimized trial division
    # Complexity: sublinear
    def prime?
      unless is_a?(Integer) && positive?
        raise ArgumentError, "primality is defined for n ∈ ℕ"
      end

      return false if self == 1
      return true if self <= 3

      if even? || (self % 3).zero?
        return false
      end

      sqrt = Math.sqrt(self)
      (5..sqrt).step(6).each do |i|
        return false if (self % i).zero? || (self % i + 2).zero?
      end

      true
    end

    # Generate a list of n primes, where n = self
    # Algorithm: Brute force
    # Complexity:
    #    Constant for n <= m, where m: the length of the file-sourced list
    #    For every incremental n > m: subquadratic (linear * sublinear)
    def primes
      unless is_a?(Integer) && self > -1
        raise ArgumentError, "length is defined for n > 0"
      end

      list = []
      candidate = 2
      length = list.length

      until length == self
        if candidate.prime?
          list << candidate
          length += 1
        end

        candidate += 1
      end

      list
    end
  end
end

class Integer
  include Primetimes::Primality
end
