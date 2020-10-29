def first_anagram?(str1, str2)                      #O(n!)
    arr1 = []                                       #O(1)
    chars = str1.split("")                          #O(n)
    words = chars.permutation.to_a                  #O(n!) 
    words.each do |sub|                              #O(n)
        arr1 << sub.join("")                           #O(1)
    end
    arr1.include?(str2)                                 #O(n)
end                                                 

def second_anagram?(str1,str2) #O(n^2)
    str1.each_char do |char|    #O(n)
        i = str2.index(char)    #O(n)
        if !i.nil?              #O(1)
            str2 = str2[0...i] + str2[(i+1)..-1]    #O(1)
        else
            return false        #O(1)
        end
    end
    str2.empty?                 #O(1)
end


def third_anagram?(str1, str2)
    arr1 = str1.split("")           #O(n)
    arr2 = str2.split("")           #O(n)
    arr1.sort == arr2.sort          #quik_sort => O(n log n)
                                    #we have to remember this
end 

# p third_anagram?("apple", "appel")
# p third_anagram?("apple", "applb")

def fourth_anagram?(str1,str2)              #O(n)
    hash1 = Hash.new(0)      #O(1)
    hash2 = Hash.new(0)     #O(1)
    str1.each_char do |char1|               #O(n)
        hash1[char1] += 1    #O(1)
    end
    str2.each_char do |char2|               #O(n)
        hash2[char2] += 1    #O(1)
    end
    hash1 == hash2                           #O(n)

    #hash = Hash.new(0)
    # str1.each_char do |char1|               #O(n)
    #     hash1[char1] += 1    #O(n)
    # end

end

# p fourth_anagram?("apple", "appel")
# p fourth_anagram?("apple", "applb")


def bonus_anagram?(str1,str2)       #O(n)
    hash = Hash.new(0)              #O(1)
    str1.each_char do |char1|           #O(n)    
        hash[char1] += 1                #O(1)
    end
    str2.each_char do |char2|              #O(n)
        hash[char2] -= 1                    #O(1)
    end
    hash.values.all?{|value| value == 0}       #O(n)
end

p bonus_anagram?("apple", "appel")
p bonus_anagram?("apple", "applb")
