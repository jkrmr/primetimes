# coding: utf-8
# frozen_string_literal: true

module Primetimes
  module Primality
    def prime?
      unless is_a?(Integer) && positive?
        raise ArgumentError, "primality is defined for n ∈ ℕ"
      end

      return false if self == 1
      return true if self == 2
      return false if even?

      sqrt = Math.sqrt(self)
      (3..sqrt).each do |i|
        return false if (self % i).zero?
      end

      true
    end

    def primes
      unless is_a?(Integer) && self > -1
        raise ArgumentError, "length is defined for n > 0"
      end

      i = 0
      memo = {}
      list = []

      until list.length == self
        i += 1
        memo[i] = i.prime? if memo[i].nil?
        list << i if memo[i]
      end

      list
    end
  end
end

class Integer
  include Primetimes::Primality
end
