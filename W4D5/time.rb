def my_in(arr)                      #O(n)
    # time1 = Time.now
    arr.inject do |acc, ele|        #O(n)
        if acc <= ele               #O(1)
            acc                     #O(1)
        else  
            ele                     #O(1)
        end
    end
    # time2 = Time.now 
    # puts (time2 - time1)
end

def my_min(arr)                 #O(n^2)
    # arr.each do |ele1| 
    #     min = 0 
    #     arr.each do |ele2| 
    #         if ele2 < ele1 
    #             min = ele2 
    #         elsif ele2 > ele1
    #             min = ele1 
    #         end  
    #     end  
    #     return min  
    # end
    # min  

    min = arr.first                     #O(1)
    i = 0                               #O(1)
    while i < arr.length                #O(n)
        ele1 = arr[i]                   #O(1)
        j = i + 1                       #O(1)
        while j < arr.length - 1        #O(n - 1)
            ele2 = arr[j]               #O(1)
            if ele1 < ele2 && ele1 < min    #O(2)
                min = ele1                  #O(1)
            elsif ele2 < ele1 && ele2 < min #O(1)
                min = ele2                  #O(1)
            end
            j += 1                          #O(1)
        end
        i += 1                              #O(1)
    end
    min                                     #O(1)
end

# puts my_min([ 0, 3, 5, 4, -5, 10, 1, 90 ])
# puts my_in([ 0, 3, 5, 4, -5, 10, 1, 90 ])


def largest_contiguous_subsum(list)         #O(n^2)
    sub_arrs = []                           #O(1)
    num = list.first                        #O(1)
    (0...list.length).each do |i|           #O(n)
        (i...list.length).each do |j|       #O(n)
            sub_arrs << list[i..j]          #??? O(1)
            #sub_arrs.shift   O(n)
            #the length of sub_arrs
        end
    end  
    p sub_arrs                              #O(1)
    sub_arrs.each do |sub|                  #O(n)
        if sub.sum > num                    #O(1)
            num = sub.sum                   #O(1)
        end  
    end  
    num                                     #O(1)
end  

list = [-5, -1, -3]
p largest_contiguous_subsum(list)

def contiguous_subsum(list)                                 #O(n)
    max_sum = list.first  #-5                               #O(1)
    current_sum = list.first  #-5                             #O(1)
    (1...list.length).each do |i|                              #O(n)
        current_sum = 0 if current_sum < 0                      #O(1)
        current_sum += list[i]  #-6                             #O(1)
        max_sum = current_sum if max_sum < current_sum          #O(1)
    end
    max_sum                                                     #O(1)
end

list = [-5, -1, -3]
p contiguous_subsum(list)
