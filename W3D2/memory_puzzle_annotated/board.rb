require_relative "card"

class Board
  attr_reader :size

  def initialize(size = 4) ## 默认建立 4 * 4 的格子, 可以被 overwritten
    @rows = Array.new(size) { Array.new(size) }
    @size = size
    populate
  end

  def [](pos)
    row, col = pos
    rows[row][col]
  end

  def []=(pos, value)
    row, col = pos
    rows[row][col] = value
  end

  def hide(pos)
    self[pos].hide
  end

  def reveal(pos)
    if revealed?(pos)
      puts "You can't flip a card that has already been revealed."
    else
      self[pos].reveal ##翻开
    end
    self[pos].value ## 返回 value
  end

## 给格子里填数字
  def populate
    num_pairs = (size**2) / 2  # ( size * size ) / 2 
    cards = Card.shuffled_pairs(num_pairs) # 建立了一些cards
    rows.each_index do |i|
      rows[i].each_index do |j|
        self[[i, j]] = cards.pop # cards减掉的card 被放到了 之前建立的格子[i][j]里
      end
    end
  end

## render就是给 字母 周围加上数字
## 如果board 是 4 * 4
#   0 1 2 3
# 0        
# 1        
# 2        
# 3   
  def render 
    system("clear") ## 你可以uncomment 掉这行 然后 在memory.rb 那里run 一下, 记得保存
    puts "  #{(0...size).to_a.join(' ')}"
    rows.each_with_index do |row, i|
      puts "#{i} #{row.join(' ')}"
    end
  end

  def revealed?(pos)
    self[pos].revealed?
  end

  def won?
    rows.all? do |row|
      row.all?(&:revealed?)
    end
  end

  ## 我不知道为什么要把这个设置为private, 请问问老师

  private

  attr_reader :rows
end
