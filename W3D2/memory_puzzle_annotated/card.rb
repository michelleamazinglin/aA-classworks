# difference between shuffle and shuffle!
# shuffle!   改变原来的array
# shuffle   不改变原来的array
######    https://ruby-doc.org/core-2.7.0/Array.html#method-i-shuffle

# a = [ 1, 2, 3 ]           #=> [1, 2, 3]
# a.shuffle                 #=> [2, 3, 1]
# a                         #=> [1, 2, 3]

# a = [ 1, 2, 3 ]           #=> [1, 2, 3]
# a.shuffle!                #=> [2, 3, 1]
# a                         #=> [2, 3, 1]

#####     https://ruby-doc.org/core-2.7.0/Array.html#method-i-take
# a = [1, 2, 3, 4, 5, 0]    #=> [1, 2, 3, 4, 5, 0] 
# a.take(3)                 #=> [1, 2, 3]

# a = [1]                   #=>[1]
# a * 2                     #=>[1, 1]

# a = [1,2,3,4,5,6]         #=> [1, 2, 3, 4, 5, 6] 
# a.shuffle.take(2) * 2     #=> [1, 6, 1, 6] 


class Card
  VALUES = ("A".."Z").to_a 
  def self.shuffled_pairs(num_pairs)
    values = VALUES
    ## num_pairs 就是你要选多少个 pair
    ## for example, 如果你要选 30 pairs 但是字母只有26个
    ## 30 = num_pairs > values.length = 26, 30 > 26
    ## 他就把 values 这个array 强行从 ["A",..,"Z"] 
    ## 变成了 ["A",..,"Z","A","B",..."Z"], 此时, values.length = 52 = 26 * 2 
    ## 来避免values 不够用
    while num_pairs > values.length
      values = values + values
    end
    values = values.shuffle.take(num_pairs) * 2
    ## 他又shuffle了一次， shuffle！ 会影响到 原本 array 从而打破规律
    values.shuffle!   ## 可以吧 [1,6,3,2,1,6,3,2] => [3,3,6,1,6,2,1,2]
    values.map { |val| self.new(val) } ##array 有多少个item 就创建了多少个card
  end

  attr_reader :value
  # value is face value
  # revealed = face-up or face-down, true = face-up , false = face-down
  def initialize(value, revealed = false) 
    @value = value
    @revealed = revealed
  end

  def hide # make it face-down
    @revealed = false
  end

  def to_s # to string
    revealed? ? value.to_s : " "
  end

  def reveal # make it face-up
    @revealed = true
  end

  def revealed? # face-up?
    @revealed
  end

  def ==(object) ##
    object.is_a?(self.class) && object.value == value
  end

  ## is_a? 检查 object 属于某个class
  ## for exmaple
  ## 100.is_a?(Numeric)     ## 100 是 属于 数字类 么
  ## miumiu.is_a?(Cat)      ## miumiu是 属于 猫类 么？
  ## https://ruby-doc.org/core-2.7.1/Object.html#method-i-is_a-3F

end
