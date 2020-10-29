def bad_two_sum?(arr, target)      #O(n^2)
    i = 0                           #O(1)
    while i < arr.length            #O(n)

        j = i + 1                     #O(1) 
        while j < arr.length - 1        #O(n)
            return true if arr[i] + arr[j] == target  #O(1)
            j += 1                                      #O(1)
        end 

        i += 1                                          #O(1)
    end 
    false                                               #O(1)
end 
 
require "byebug"
def okay_two_sum?(arr, target)  #O(n log n)
    sorted = arr.sort       #O(n log n)
    # debugger
    return false if sorted.length < 2   #O(1)
    mid = sorted.length / 2             #O(1)
    case sorted[mid] + sorted[mid - 1] <=> target       #O(1)
    when 0              #O(1)
        return true         #O(1)
    when 1    #sum > target         #O(1)
        okay_two_sum?(sorted.take(mid), target)         #O(log n)
    when -1   #sum < target         #O(1)
        result = okay_two_sum?(sorted.drop(mid + 1), target)   #O(log n)
        return false if result == false     #O(1)
    end
end


#check every possible pair

def two_sum?(arr, target_sum)  #O(n)
  complements = {}

  arr.each do |el|
    return true if complements[target_sum - el]
    complements[el] = true
  end

  false
end
#key => ele
#value => target - ele


#better way:
#check hash[key] matchs (target - ele) => difference
arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false