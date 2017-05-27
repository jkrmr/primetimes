# frozen_string_literal: true

module Primetimes
  class PrimesTablePrinter
    attr_reader :output, :cell_string, :max_product_length

    def initialize(output = $stdout)
      @output = output
      @cell_string = {}
    end

    def print(table)
      @max_product_length = table.max_product_length
      table_rows = table.to_a.map { |row| row_string(row).join(" ") }
      table_rows << ""
      output << table_rows.join("\n")
    end

    private

    def row_string(row)
      row.map do |cell|
        unless cell_string[cell]
          cell_string[cell] = cell.to_s.rjust(max_product_length)
        end

        cell_string[cell]
      end
    end
  end
end
