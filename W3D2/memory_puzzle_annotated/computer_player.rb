class ComputerPlayer
  attr_accessor :previous_guess, :board_size

  def initialize(size)
    @board_size = size
    @matched_cards = {} # hash
    @known_cards = {} # hash
    @previous_guess = nil
  end

  def receive_revealed_card(pos, value)
    @known_cards[pos] = value # 放进 hash
  end

  def receive_match(pos1, pos2)
    @matched_cards[pos1] = true # 放进 hash
    @matched_cards[pos2] = true # 放进 hash
  end

  def random_guess
    guess = nil
    until guess && !@known_cards[guess] #随机猜, 猜到了重复的再猜
      guess = [rand(board_size), rand(board_size)]
    end
    guess
  end

  def first_guess
    unmatched_pos || random_guess
  end

  def second_guess
    match_previous || random_guess
  end

  def get_input
    if previous_guess
      second_guess
    else
      first_guess
    end
  end

  # def foo(_,_)
  #   p _
  # end
  # foo(11, 22) #=> 11

  # def foo(x,_)
  #   p x
  # end
  # foo(11, 22) #=> 11


  ##  undersocre 是用来占位置的
  ##   (pos, _) 改成 (pos, val) 或者 (pos, x) 或者 (pos, ) 或者(pos,) 不带空格
  ##  但是把 (pos, _) 改成 pos 就会报错
  ##  因为你搜了俩 pos, val

  ##看最下面的例子来理解这些
  def unmatched_pos ## 在所有已知cards known_cards中找没配对的
    (pos, _ ) = @known_cards.find do |pos, i| ## 在known_cards hash里找 .find => return stuff
      @known_cards.any? do |pos2, k| ## 在known_cards里找 符合， .any？=> return true/false
        pos != pos2 && i == k && !(@matched_cards[pos] || @matched_cards[pos2])
      end
    end
    pos
  end

  def match_previous
    (pos, _ ) = @known_cards.find do |pos, val|
      pos != previous_guess && val == @known_cards[previous_guess] && !@matched_cards[pos]
    end
    pos
  end

end


#a = [1,3,5,7,9,2,4,6,8,10]
# def foo(a)
#     (ele,_) = a.find do |ele, i| 
#         a.any? do |ele2, k| 
#             ele%2 == 0 && i == k
#         end
#     end
#     p ele
# end

# def foo2(a)
#     ele = a.find do |ele| 
#         a.any? do |ele2| 
#             ele2%2 == 0
#         end
#     end
#     p ele
# end

# foo(a)  #=>1
# foo2(a) #=>2



