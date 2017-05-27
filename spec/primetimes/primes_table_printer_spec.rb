# frozen_string_literal: true

require "spec_helper"
require "primetimes/primes_table_printer"

module Primetimes
  RSpec.describe PrimesTablePrinter do
    it "prints a formatted times table to stdout" do
      table_array = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
      table = double(:primes_table, to_a: table_array, max_product_length: 1)

      output = described_class.new(table, StringIO.new).print

      expect(output.string).to eq <<~STR
      1 2 3
      4 5 6
      7 8 9
      STR
    end
  end
end
