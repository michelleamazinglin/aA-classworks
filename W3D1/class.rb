class Array

    def my_each_with_block(&prc) #block convert to prc
        i = 0 #index
        while i < self.length
            ele = self[i] # we're in an instance method on the arr class, so self is this arr instancce
            prc.call(ele)
            i += 1
        end
        self #each returns the origital arr
    end
#block_given? is a built in ruby boolean method to check if a block was given to the method

    def my_each_with_proc(prc)
        #self.my_each_with_block(prc)
        #expection a block but passing in a prc
        self.my_each_with_block(&prc) # the & conver the prc back in to a block
        
    end


end