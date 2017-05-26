# frozen_string_literal: true

require "spec_helper"
require "primetimes/primes_table_printer"

module Primetimes
  RSpec.describe PrimesTablePrinter do
    it "prints a formatted times table to stdout" do
      table = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

      output = described_class.new(StringIO.new).print(table).string

      expect(output).to eq <<~STR
      1 2 3
      4 5 6
      7 8 9
      STR
    end
  end
end
