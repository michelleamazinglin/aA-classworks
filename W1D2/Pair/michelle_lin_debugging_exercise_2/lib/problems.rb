# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require "byebug"
def prime?(num)
    if num < 2
        return false
    end
    (2...num).each do |factor|
        return false if num % factor == 0
    end
    true
end

def largest_prime_factor(num)
    (2..num).select {|i| num % i == 0 && prime?(i)}.max
end

def unique_chars?(str)
    count = Hash.new(0)
    str.each_char do |char|
        count[char] += 1
        return false if count[char] > 1
    end
    true
end

def dupe_indices(arr)
    count = Hash.new {|k, v| count[k] = []}
    arr.each_with_index do |char, i|
        count[char] += [i]
    end
    count.select {|k, v| v.length > 1}
end
# debugger
# p dupe_indices(["a", "b", "c", "c", "b"])

def ana_array(arr1, arr2)
    arr1.all? {|ele| arr2.include?(ele)} && arr2.all?{|ele| arr1.include?(ele)} && arr1.length == arr2.length
end