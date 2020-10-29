#很简单 一看就懂
class HumanPlayer
  attr_accessor :previous_guess

  def initialize(size)
    @previous_guess = nil
  end

  def prompt ## 提词
    puts "Please enter the position of the card you'd like to flip (e.g., '2,3')"
    print "> "
  end

  def parse(string) ##分析词
    string.split(",").map { |x| Integer(x) }
  end

  def get_input
    prompt
    parse(STDIN.gets.chomp)
  end

  def receive_revealed_card(pos, value)
    # duck typing
  end

  def receive_match(pos1, pos2)
    puts "It's a match!"
  end
end