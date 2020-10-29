def duos(str)
    # count = 1
    # arr = str.split("")
    # .inject do |acc,ele|
    #     if acc == ele
    #         count += 1
    #     end
    # end
    # count

    i = 0
    count = 0
    while i < str.length - 1
        if str[i] == str[i + 1]
            count += 1
        end
        i += 1
    end
    count

    # count = 0
    # (0...str.length -1).each do |i|
end

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

# puts "-----"



def sentence_swap(sent, hash)
    words = sent.split(" ")
    words.map! do |word| 
        if hash.has_key?(word)
            hash[word]
        else
            word
        end
    end
    words.join(" ")
end

# p sentence_swap('anything you can do I can do',
#   'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#   'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#   'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'

# puts "-----"

def hash_mapped(hash, prc1, &prc2)
  new_hash = {}
  hash.each do |k,v|
    new_k = prc2.call(k)
    new_v = prc1.call(v)
    new_hash[new_k] = new_v
  end
  new_hash
end

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}

# puts "-----"

def counted_characters(str)
  count = Hash.new(0)
  result = []
  str.each_char do |char|
    count[char] += 1
    # if count[char] > 2
    #   result << char
    end
  count.each do |k, v|
    if v > 2
      result << k
    end
  end
  result

end

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []

# puts "-----"

def triplet_true(str)
  i = 0 
  while i < str.length - 2
    if str[i] == str[i+1] && str[i+1] == str[i+2]
      return true
    end
    i += 1
  end
  false
end

# p triplet_true('caaabb')        # true
# p triplet_true('terrrrrible')   # true
# p triplet_true('runninggg')     # true
# p triplet_true('bootcamp')      # false
# p triplet_true('e')             # false

# puts "-----"

def energetic_encoding(str, hash)
  new_str = ""
  str.each_char do |char|
    if char == " "
      new_str += " "
    elsif hash.has_key?(char)
      new_str += hash[char]
    else
      new_str += "?"
    end
  end
  new_str
end

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'

# puts "-----"

# def uncompress(str)
#     # new_str = ""
#     # i = 0
#     # while i < str.length
#     #     # str[i]
#     #     new_str += str[i] * str[i + 1].to_i
#     #     i += 2
#     # end
#     # new_str

#     new_str = ""
#     i = 0
#     while i < str.length - 1
#         char = str[i]
#         num = str[i + 1].to_i
#         new_str += char * num
#         i += 1
#     end
#     new_str
# end

# uncompress('a2b4c1') # 'aabbbbc'
# uncompress('b1o2t1') # 'boot'
# uncompress('x3y1x2z4') # 'xxxyxxzzzz'

def conjunct_select(arr, *prcs) 
    arr.select { |ele| prcs.all? { |prc| prc.call(ele) }}
end

is_positive = Proc.new { |n| n > 0 }
is_odd = Proc.new { |n| n.odd? }
less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

def convert_pig_latin(sent)
  words = sent.split(" ")
  new_words = []
  words.each do |word|
    if word.length < 3
      new_words << word
    else
      if word == word.capitalize
        new_words << convert(word).capitalize
      else
        new_words << convert(word)
      end
    end
  end
  new_words.join(" ")    
end

def convert(word)
  vowels = "aeiouAEIOU"
  if vowels.include?(word[0])
    return word + "yay"
  else
    word.each_char.with_index do |char, i|
      if vowels.include?(char)
        return word[i..-1] + word[0...i] + "ay"
      end
    end
  end
end

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

def reverberate(sent)
  words = sent.split(" ")
  new_words = []
  words.each do |word|
    if word.length < 3
      new_words << word
    else
      if word == word.capitalize
        new_words << reverberated(word).capitalize
      else
        new_words << reverberated(word)
      end
    end
  end
  new_words.join(" ")    
end

def reverberated(word)
  vowels = "aeiouAEIOU"
  if vowels.include?(word[-1])
        return word + word
  else
        i = word.length - 1
    while i >= 0
        if vowels.include?(word[i])
            return word + word[i..-1]
        end
        i -= 1
    end
  end
end

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

def disjunct_select(arr, *prc)
        arr.select { |ele| prc.any? { |p| p.call(ele) }}
end

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]

def alternating_vowel(sent)
    words = sent.split(" ")
    new_words = []
    words.each_with_index do |word,i| 
        if i.even?
          new_words << no_first_vowel(word)
        else
          new_words << no_last_vowel(word)
        end
    end
    words.join(" ")
end

def no_first_vowel(word)
    vowels = "aeiou"
    word.each_char.with_index do |char, i|
        if vowels.include?(char)
          return word[0...i] + word[i+1..-1]
        else
          return word
        end
    end
end
p no_first_vowel("panthers")

def no_last_vowel(word)
  vowels = "aeiou"
  i = word.length - 1
  while i >= 0
    if vowels.include?(word[i])
      return word[0...i] + word[i+1..-1]
    else
      return word
    end
    i -= 1
  end
end
p no_last_vowel("panthers")

p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
p alternating_vowel('code properly please') # "cde proprly plase"
p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"