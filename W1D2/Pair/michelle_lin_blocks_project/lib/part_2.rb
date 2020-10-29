def all_words_capitalized?(words)
    words.all? {|word| word[0].upcase + word[1..-1].downcase == word}
end

def no_valid_url?(arr)
    arr.none? {|ele| ['com', 'net', 'io', 'org'].include?(ele.split(".")[-1])}
end

def any_passing_students?(arr)
    arr.any?{ |ele| ele[:grades].sum / ele[:grades].length.to_f >= 75 }
end