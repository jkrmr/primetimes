# frozen_string_literal: true

require "primetimes/primality"
require "primetimes/primes_list"
require "primetimes/primes_table"
require "primetimes/primes_table_printer"

module Primetimes
  def self.print(num_of_primes)
    table = PrimesTable.new(n: num_of_primes)
    PrimesTablePrinter.new.print(table)
  end
end
