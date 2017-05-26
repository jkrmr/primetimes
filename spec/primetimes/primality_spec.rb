# frozen_string_literal: true

require "spec_helper"
require "primetimes/primality"

module Primetimes
  RSpec.describe Primality do
    describe "#prime?" do
      it "given a number for which primality is undefined, raises" do
        expect { -1.prime? }.to raise_error { ArgumentError }
        expect { 0.prime? }.to raise_error { ArgumentError }
        expect { 3.4.prime? }.to raise_error { ArgumentError }
      end

      it "given a number less than 2, returns false" do
        expect(1).to_not be_prime
        expect(333).to_not be_prime
      end

      it "given a prime number, returns true" do
        expect(2).to be_prime
        expect(3).to be_prime
        expect(31).to be_prime
      end

      it "given a composite number, returns false" do
        expect(4).to_not be_prime
        expect(9).to_not be_prime
        expect(34).to_not be_prime
        expect(55).to_not be_prime
      end
    end

    describe "#primes" do
      it "given a non-natural-number, raises" do
        expect { -1.primes }.to raise_error { ArgumentError }
        expect { 3.4.primes }.to raise_error { ArgumentError }
      end

      it "given 0, returns an empty array" do
        expect(0.primes).to eq []
      end

      it "given 3, returns a list of the first three primes" do
        expect(3.primes).to eq [2, 3, 5]
      end

      it "given 10, returns a list of the first 10 primes" do
        expect(10.primes).to eq [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
      end
    end
  end
end
