# frozen_string_literal: true

require "spec_helper"
require "primetimes/primes_table"

module Primetimes
  RSpec.describe "PrimesTable#to_a" do
    context "given n == 4" do
      it "returns a nested product array of the first 4 primes" do
        table = PrimesTable.new(n: 4).to_a

        expect(table).to eq [[nil,  2,  3,  5,  7],
                             [  2,  4,  6, 10, 14],
                             [  3,  6,  9, 15, 21],
                             [  5, 10, 15, 25, 35],
                             [  7, 14, 21, 35, 49]]
      end
    end
  end
end
