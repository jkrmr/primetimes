# coding: utf-8
# frozen_string_literal: true

module Primetimes
  module Primality
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

    def primes
      unless is_a?(Integer) && self > -1
        raise ArgumentError, "length is defined for n > 0"
      end

      i = 0
      list = []

      until list.length == self
        i += 1
        list << i if i.prime?
      end

      list
    end
  end
end

class Integer
  include Primetimes::Primality
end
