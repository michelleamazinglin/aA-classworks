require "byebug"


class Item

    attr_reader :title, :deadline, :description
    attr_writer :title, :description

    def self.valid_date?(date_string)
        month = (1..12).to_a
        date = (1..31).to_a
        arr = date_string.split("-")
        return false if !month.include?(arr[1].to_i)
        return false if !date.include?(arr[2].to_i)
        true
    end

    def initialize(title, deadline, description)
        @title = title 
        @description = description
        # @deadline = deadline
        # debugger
        if Item.valid_date?(deadline)
            @deadline = deadline
        else 
            raise "ERROR"
        end 
    end

    def deadline=(new_deadline)
        # debugger
        if !Item.valid_date?(new_deadline)
            raise "ERROR"
        else
            @deadline = new_deadline
        end
    end
end

# my_item = Item.new('Fix login page', '2019-10-22', 'It loads slow.')