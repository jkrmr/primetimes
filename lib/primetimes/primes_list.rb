# frozen_string_literal: true

require "json"

module PrimesList
  DATA_DIR = File.join File.expand_path("../..", File.dirname(__FILE__)), "data"
  PRIMES_LIST_PATH = File.join(DATA_DIR, "primes.json")
  PRIMES_LIST = JSON.parse(File.read(PRIMES_LIST_PATH)).freeze

  def self.list
    PRIMES_LIST
  end

  def self.save
    File.open(PRIMES_LIST_PATH, "w") do |f|
      f << JSON.dump(PRIMES_LIST)
    end
  end
end
