require_relative "board"
require_relative "human_player"
require_relative "computer_player"

class MemoryGame
  attr_reader :player

  def initialize(player, size = 4)
    @board = Board.new(size)
    @previous_guess = nil
    @player = player
  end

  def play
    until board.won? #除非赢 不然一直玩 
      board.render # 给board建立数字
      pos = get_player_input # 获取position
      make_guess(pos) # 确认 猜测
    end
    puts "Congratulations, you win!"
  end

  def get_player_input
    pos = nil
    until pos && valid_pos?(pos)
      pos = player.get_input ##去call computer_player.rb/human_player.rb 的get_input
    end
    pos
  end

  ## is_a可以参考card.rb 的注释
  def valid_pos?(pos)
    pos.is_a?(Array) &&
      pos.count == 2 &&
      pos.all? { |x| x.between?(0, board.size - 1) } ## 检查猜的数字是不是在范围里
  end

  def make_guess(pos)
    revealed_value = board.reveal(pos)
    player.receive_revealed_card(pos, revealed_value)
    board.render
    compare_guess(pos)
    sleep(0.1) # 暂停 1 秒  
    board.render
  end

  def compare_guess(new_guess)
    if previous_guess
      if match?(previous_guess, new_guess)
        player.receive_match(previous_guess, new_guess)
      else
        puts "Try again."
        [previous_guess, new_guess].each { |pos| board.hide(pos) }
      end
      self.previous_guess = nil
      player.previous_guess = nil
    else
      self.previous_guess = new_guess
      player.previous_guess = new_guess
    end
  end

  def match?(pos1, pos2)
    board[pos1] == board[pos2]
  end

  private

  attr_accessor :previous_guess
  attr_reader :board
end


## 比如 你可以run ruby memory.rb 2 那么格子就是2 * 2
## 如果 run ruby memory.rb 那么格子就是 4 * 4

# if ARGV.empty?
#   size = 4
# else
#   size = ARGV.shift.to_i
# end

if $PROGRAM_NAME == __FILE__ ##如果运行文件是本文件
  size = ARGV.empty? ? 4 : ARGV.shift.to_i ## 如果 arg是空的，那么 4, 如果不是空的, 用input的数字
  ## if ARGV.empty?
  ##   size = 4
  ## else
  ##   size = ARGV.shift.to_i
  ## end
  MemoryGame.new(ComputerPlayer.new(size), size).play ## 建立个新游戏, 然后 开始 玩
end

# 人类玩就 uncomment 下面这段, 然后 comment 掉上面那段来, vice versa
# 可以改数字 来改变默认board大小 只能是偶数 奇数会导致少个数字 从而运行到一半的时候报错

# if $PROGRAM_NAME == __FILE__
#   size = ARGV.empty? ? 2 : ARGV.shift.to_i 
#   MemoryGame.new(HumanPlayer.new(size), size).play
# end