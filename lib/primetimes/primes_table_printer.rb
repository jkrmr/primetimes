# frozen_string_literal: true

module Primetimes
  class PrimesTablePrinter
    attr_reader :output

    def initialize(output = $stdout)
      @output = output
    end

    def print(table)
      output << table.to_a.map { |row| row_string(row, table) }.join("\n")
      output << "\n"
    end

    private

    def row_string(row, table)
      row.map { |cell| cell.to_s.rjust(table.max_product_length) }
         .join(" ")
    end
  end
end
