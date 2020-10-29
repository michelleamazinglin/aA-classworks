# Write a method, union, that accepts any number of arrays as arguments.
# The method should return an array containing all elements of the given arrays.
def union(*arr)
   arr.inject { |acc, arr| acc + arr }
end

p [1,2,3] + [4,5]
p union(["a", "b"], [1, 2, 3]) # => ["a", "b", 1, 2, 3]
p union(["x", "y"], [true, false], [20, 21, 23]) # => ["x", "y", true, false, 20, 21, 23]
