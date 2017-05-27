# frozen_string_literal: true

require "primetimes/primality"
require "primetimes/primes_list"
require "primetimes/primes_table"
require "primetimes/primes_table_printer"

module Primetimes
  def self.print(num_of_primes, output = $stdout)
    table = PrimesTable.new(n: num_of_primes)
    PrimesTablePrinter.new(output).print(table)
  end
end
