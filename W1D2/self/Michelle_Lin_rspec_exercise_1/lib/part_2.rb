def hipsterfy(str)
    vowel = "aeiou"
    new_str = ""
    i = -1
    while i > str.length * -1
        if vowel.include?(str[i])
            if i == -1
                return str[0...i]
            else
                return str[0...i] + str[i+1..-1]
            end
        else
            i -= 1
        end
    end
    str
end

def vowel_counts(str)
   vowel = "aeiou"
   count = Hash.new(0)
   str.downcase.each_char do |char|
    if vowel.include?(char)
        count[char] += 1
    end
   end
   count
end

def caesar_cipher(str,num)
    new_str = ""
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    str.each_char do |char|
        if alphabet.include?(char)
            i = alphabet.index(char)
            new_i = i + num
            new_char = new_i % 26
            new_str << alphabet[new_char]
        else
            new_str << char
        end
    end
    new_str
end


