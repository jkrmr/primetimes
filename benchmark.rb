# coding: utf-8
# frozen_string_literal: true

$LOAD_PATH.unshift(File.join(File.expand_path(File.dirname(__FILE__)), "lib"))

require "primetimes"
require "benchmark"
require "profile"

Benchmark.bmbm do |bm|
  [100, 1_000].each do |n|
    bm.report("n: #{n}") { Primetimes.print(n, StringIO.new) }
  end
end

# Bare:
# primetimes master % ruby benchmark.rb
#                user     system      total        real
# n: 1       0.000000   0.000000   0.000000 (  0.000268)
# n: 10      0.000000   0.000000   0.000000 (  0.001536)
# n: 100     0.030000   0.000000   0.030000 (  0.033594)
# n: 1000    1.620000   0.210000   1.830000 (  1.828361)
# n: 10000 129.780000  14.240000 144.020000 (144.213969)

#   %   cumulative   total
#  time   seconds   ms/call  name

#  43.43   112.12      0.05  Primetimes::PrimesTablePrinter#row_string
#  29.05   187.11     48.44  Array#map
#   9.56   211.79      0.01  Primetimes::PrimesTable#max_product_length
#   5.42   225.78      0.00  Integer#to_s
#   3.92   235.90      0.01  Primetimes::PrimesTable#_inner_table
#   2.55   242.48      0.00  Kernel#nil?
#   2.41   248.69      0.00  String#rjust
#   2.02   253.91      0.00  NilClass#nil?
