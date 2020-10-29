class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(arr)
    arr.all? {|ele| POSSIBLE_PEGS.has_key?(ele.downcase) || POSSIBLE_PEGS.has_key?(ele.upcase)}
  end

  attr_reader :pegs

  def initialize(arr)
     if Code.valid_pegs?(arr)
      @pegs = arr.map {|ele| ele.upcase}
     else
      raise "Not Valid"
     end
  end

require "byebug"

  def self.random(length)
    arr = Array.new(length){POSSIBLE_PEGS.keys.sample}
    Code.new(arr)
  end

  def self.from_string(string)
    arr = string.split("")
    Code.new(arr)
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code)
    count = 0
    code.pegs.each_with_index do |char, i|
      if @pegs[i] == char
        count += 1
      end
    end
    return count
  end

  def num_near_matches(code)

    count = 0 
    code.pegs.each_with_index do |char, i|
      @pegs.each_with_index do |ele, j|
        if i == j && char != ele && @pegs.include?(char)
          count += 1
        end
      end
    end
    count
  end

  def == (code)
    return false if code.pegs.length != self.length
    self.pegs == code.pegs

  end

end

#p code = Code.random(5)