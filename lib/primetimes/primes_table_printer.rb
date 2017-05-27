# frozen_string_literal: true

module Primetimes
  class PrimesTablePrinter
    attr_reader :grid, :output, :cell_string, :max_product_length

    def initialize(table, output = $stdout)
      @output = output
      @cell_string = {}
      @grid = table.to_a
      @max_product_length = table.max_product_length
    end

    def print
      rows = grid.map { |row| _row_string(row) }
      rows << []

      output << rows.join("\n")
    end

    private

    def _row_string(row)
      cells = row.map do |int|
        unless cell_string[int]
          cell_string[int] = int.to_s.rjust(max_product_length)
        end

        cell_string[int]
      end

      cells.join(" ")
    end
  end
end
