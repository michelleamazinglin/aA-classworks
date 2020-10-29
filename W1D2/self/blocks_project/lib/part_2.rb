def all_words_capitalized?(arr)
    arr.all? { |ele| ele.capitalize == ele }
end

def no_valid_url?(arr)
    url = [".com",".net",".io",".org"]
    arr.none? do |ele|
        url.any? {|ending| ele.end_with?(ending)}
    end
end

def any_passing_students?(arr)
    arr.any? do |hash|
        avg = hash[:grades].sum / hash[:grades].length
        avg > 75
    end
end
