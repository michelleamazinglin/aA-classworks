def partition(arr, num)
    newArr = []
    subArr1 = []
    subArr2 = []
    arr.each do |n|
        if n < num
            subArr1 << n
        elsif n >= num
            subArr2 << n
        end
        newArr = [subArr1,subArr2]
    end
    newArr
end

def merge(hash_1, hash_2)
    newHash = {}
    hash_1.each {|k,v| newHash[k] = v }
    hash_2.each {|k,v| newHash[k] = v }
    newHash
end

def censor(sentence, arr)
 newSentence = []
 words = sentence.split(" ")
    words.each do |word|
        if arr.include?(word.downcase)
            newSentence << no_vowel(word)
        else
            newSentence << word
        end
    end
newSentence.join(" ")
end

def no_vowel(word)
    vowel = "aeiou"
    new_word = ""
    word.each_char do |char|
        if vowel.include?(char.downcase)
            new_word << "*"
        else
            new_word << char
        end
    end
    new_word
end


def power_of_two?(num)
    product = 1
    if num == 1
        return true
    end
    while product < num
        product *= 2
    end
    product == num
end
