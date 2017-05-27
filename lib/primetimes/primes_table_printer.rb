# frozen_string_literal: true

module Primetimes
  class PrimesTablePrinter
    attr_reader :output, :cell_string

    def initialize(output = $stdout)
      @output = output
      @cell_string = {}
    end

    def print(table)
      table_rows = table.to_a.map! { |row| row_string(row, table).join(" ") }
      table_rows << ""
      output << table_rows.join("\n")
    end

    private

    def row_string(row, table)
      row.map! do |cell|
        if cell_string[cell].nil?
          cell_string[cell] = cell.to_s.rjust(table.max_product_length)
        end

        cell_string[cell]
      end
    end
  end
end
