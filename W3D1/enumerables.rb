class Array

    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
    end

    def my_select(&prc)
        arr = []
        self.my_each do |ele|
            arr << ele if prc.call(ele)
        end
        arr
    end

    def my_flatten
        arr = []
        self.my_each do |ele|
            if ele.class == Integer
                arr << ele
            else
                ele.my_flatten
            end
        end
        arr
    end

    def my_zip(*num)
        #num = [].unshiftself
        num.unshift(self)

        arr = Array.new(num[0].length) {Array.new(num.length)}
        #arr = Array.new() {Array.new(num.length)}
        arr.each_with_index do |sub, row|
            sub.each_with_index do |ele, col|
                arr[row][col] = num[col][row]
            end
        end
        arr
    end

    def my_join(sep = "")
        str = ""
        self.each_with_index do |ele, i|
            if i < self.length - 1
                str << ele + sep
            else
                str << ele
            end
        end
        str
    end

    def my_reverse
        arr = []
        self.each do |ele|
            arr.unshift(ele)
        end
        arr
    end

    def my_reject(&prc)
        arr = []
        self.each do |ele|
            arr << ele if !prc.call(ele)
        end
        arr
    end
    
    def my_any?(&prc)
        arr = [] 
        # self.any? {|ele| prc.call(ele)}
        self.each do |ele|
            if prc.call(ele)
                arr << ele
            end
        end
        return true if arr.length > 0
        false
    end

    def my_all?(&prc)
        self.each do |ele|
            return false if !prc.call(ele)
        end
        true
    end

    def my_rotate(num=1)
        arr = []
        self.each do |ele|
            arr << ele
        end
        if num >=0
            num.times do 
                arr << arr.shift
            end
        else
            (-num).times do 
                arr.unshift(arr.pop)
            end
        end
        arr
    end

    def my_reverse
        arr = []
        self.each do |ele|
            arr.unshift(ele)
        end
        arr
    end

end