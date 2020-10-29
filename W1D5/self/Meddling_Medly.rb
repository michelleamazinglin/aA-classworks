def duos(str)
    count = 0
    i = 0
    while i < str.length - 1
        if str[i] == str[i+1]
            count += 1
        end
        i += 1
    end
    count
end

def sentence_swap(str, hash)
    words = str.split(" ")
    arr = []
    words.each do |word|
        if hash.has_key?(word)
            arr << hash[word]
        else
            arr << word
        end
    end
    arr.join(" ")
end

def hash_mapped(hash, prc1, &prc2)
    new_hash = {}
    hash.each do |k,v|
        new_k = prc2.call(k)
        new_v = prc1.call(v)
        new_hash[new_k] = new_v
    end
    new_hash
end

def counted_characters
    
end