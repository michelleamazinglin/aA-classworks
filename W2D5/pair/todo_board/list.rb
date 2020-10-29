require_relative "item.rb"
require "byebug"

class List

    attr_reader :label
    attr_writer :label 

    def initialize(label)
        @label = label
        @items = []
    end 

    def add_item(title, deadline, *description)
        if Item.valid_date?(deadline)
            new_item = Item.new(title, deadline, description) 
            @items << new_item
            return true
        else
            return false
        end
    end

    def size
        @items.length 
    end 

    def valid_index?(index)
        return false if index<0 || index>@items.length-1 
        true
    end 

    # debugger
    def swap(idx1, idx2)
        if valid_index?(idx1) && valid_index?(idx2)
            @items[idx1], @items[idx2] = @items[idx2], @items[idx1]
            return true
        else
            return false
        end
    end

    def [](ind)
        return nil if !valid_index?(ind)
        @items[ind]
    end 

    def priority
        @items[0]
    end 

    def print
        puts @label
        @items.each_with_index do |item,i|
            puts "#{i}:  #{item.title}:  #{item.deadline}" #string interpolation
            #"hello".ljust(20) ... #=> "hello               "
        end
        return nil
    end 

    def print_full_item(index)
        return if !valid_index?(index)
        item = @items[index]
        puts " #{item.title}:  #{item.deadline}: #{item.description}"
        return nil 
    end

    def print_priority
        puts " #{priority.title}:  #{priority.deadline}: #{priority.description}"
        print_full_item(0)
        return nil
    end 

    def up(idx, amt=1) #itms=[1,2,3,4,5], i=4, amt =2 
        return false if !valid_index?(idx)
        amt.times do #2times, 
            if idx != 0
                @items[idx], @items[idx-1] = @items[idx-1], @items[idx]
                idx -=1
            end
        end
        true
    end 


    def down(idx, amt = 1)
        return false if !valid_index?(idx)
        amt.times do #2times, 
            if idx != @items.length - 1
                @items[idx], @items[idx+1] = @items[idx+1], @items[idx]
                idx +=1
            end
        end
        true
    end

    def sort_by_date!
        @items.sort_by! {|item_obj| item_obj.deadline}
    end 

end 


# @items=
#   [#<Item:0x00007f85bc32fa98 @deadline="2019-10-24", @description=[], @title="shampoo">,
#    #<Item:0x00007f85bd500f38 @deadline="2019-10-25", @description=[], @title="toothpaste">,
#    #<Item:0x00007f857c433ce0 @deadline="2019-10-25", @description=["Get American and Feta for good measure."], @title="cheese">,
#    #<Item:0x00007f858c3c85e8 @deadline="2019-10-31", @description=["4 bags should be enough"], @title="candy">],
#  @label="Groceries">