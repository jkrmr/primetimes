# frozen_string_literal: true

module Primetimes
  class PrimesTablePrinter
    attr_reader :output

    def initialize(output = $stdout)
      @output = output
    end

    def print(table)
      output << table.map { |row| row.join(" ") }.join("\n")
      output << "\n"
    end
  end
end
