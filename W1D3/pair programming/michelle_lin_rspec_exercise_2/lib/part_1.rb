def partition(arr, num)
    greater = []
    lesser = []
    answer = []
    arr.each do |ele|
        if ele >= num
            greater << ele
        else
            lesser << ele
        end
    end
    answer << lesser
    answer << greater
    answer
end

def merge(hash1, hash2)
    hash = {}
    hash1.each do |k, v|
        if hash2.has_key?(k)
            hash[k] = hash2[k]
        else
            hash[k] = hash1[k]
        end
    end
    hash2.each do |k, v|
        hash[k] = hash2[k]
    end
    hash
end

def censor(sentence, array)
    words = sentence.split(" ")
    words.each_with_index do |word, i|
        if array.include?(word.downcase)
            words[i] = curse_word(word)
        end
    end
    words.join(" ")
end

def curse_word(word)
    vowels = 'aeiouAEIOU'
    word.each_char.with_index do |char, i|
        if vowels.include?(char)
            word[i] = '*'
        end
    end
    word
end

def power_of_two?(num)
    return true if num == 1
    i = 1
    # accum = 2
    while 2 ** i <= num
        return true if 2 ** i == num
        i += 1
    end
    false
end


                

        

        
