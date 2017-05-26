# frozen_string_literal: true

require "spec_helper"
require "primetimes/primality"

module Primetimes
  RSpec.describe Primality do
    describe "prime?" do
      it "given a number less than 2, returns false" do
        expect(0).to_not be_prime
        expect(1).to_not be_prime
      end

      it "given a prime number, returns true" do
        expect(2).to be_prime
        expect(3).to be_prime
        expect(31).to be_prime
      end

      it "given a composite number, returns false" do
        expect(4).to_not be_prime
        expect(34).to_not be_prime
        expect(55).to_not be_prime
      end
    end
  end
end
