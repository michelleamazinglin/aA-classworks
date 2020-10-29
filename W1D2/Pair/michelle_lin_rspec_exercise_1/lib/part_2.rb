def hipsterfy(word)
    vowels = "aeiou"
    word = word.reverse
    word.each_char do |char|
        if vowels.include?(char)
            i = word.index(char)
            return (word[0...i] + word[i + 1..-1]).reverse
        end
    end
    word.reverse
end

def vowel_counts(str)
    vowels = "aeiou"
    count = Hash.new(0)
    str.downcase.each_char do |ele|
        if vowels.include?(ele)
            count[ele] += 1
        end
    end
    count
end

def caesar_cipher(str,n)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    arr = str.split("")
    arr.map! {|char|  alphabet.include?(char) ? alphabet[(alphabet.index(char) + n) % 26] : char }
    arr.join("")
end