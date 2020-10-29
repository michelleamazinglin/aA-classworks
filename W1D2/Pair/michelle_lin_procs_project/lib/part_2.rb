def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(str, &prc)
    arr = str.split(" ")
    arr.map! {|word| prc.call(word)}
    arr.join(" ") 
end

def greater_proc_value(n, p1, p2)
    if p1.call(n) > p2.call(n)
        p1.call(n)
    else
        p2.call(n)
    end
end

# def and_selector(arr, p1, p2)
#     new_arr = []
#     arr.each do |ele|
#         if p1.call(ele) && p2.call(ele)
#             new_arr << ele
#         end
#     end
#     new_arr
# end

def and_selector(arr, p1, p2)
    arr.select {|ele| p1.call(ele) && p2.call(ele) }
end

# def alternating_mapper(arr, p1, p2)
#     new_arr = []
#     (0...arr.length).each do |i|
#         if i.even?
#             new_arr << p1.call(arr[i])
#         else
#             new_arr << p2.call(arr[i])
#         end
#     end
#     new_arr
# end

def alternating_mapper(arr, p1, p2)
    (0...arr.length).map {|i| i.even? ? p1.call(arr[i]) : p2.call(arr[i])}
end