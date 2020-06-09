require "byebug"
class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(arr)
    arr.all? {|char| POSSIBLE_PEGS.has_key?(char.upcase)}

  end

  def initialize(arr)
    @pegs = []
    if Code.valid_pegs?(arr)
      arr.each {|char| @pegs << char.upcase}
    else
      raise_error
    end

  end

  def self.random(num)
    final_arr = []
    possible_keys = []
    POSSIBLE_PEGS.each_key {|k| possible_keys << k}
    num.times do
    final_arr << possible_keys[rand(possible_keys.length - 1)]
    end
    Code.new(final_arr)
  end

  def self.from_string(pegs)
    final_arr = []
    pegs.each_char {|char| final_arr << char}
    Code.new(final_arr)
  end

  def [](idx)
    @pegs[idx]
  end

  def length
@pegs.length
  end

  def num_exact_matches(arr)
    count = 0
    arr.pegs.each.with_index do |char, idx|
      count += 1 if @pegs[idx] == char
    end
    count
  end

  def num_near_matches(arr)
    num_matches = (0...arr.length).count do |i|
      arr_pegs = arr[i]
      @pegs.include?(arr_pegs)
    end

    num_matches - self.num_exact_matches(arr)



  end

  def ==(arr)
    if arr.length != @pegs.length
      return false
    end

    if arr == @pegs
      return true
    else
      return false
    end
  end






end
