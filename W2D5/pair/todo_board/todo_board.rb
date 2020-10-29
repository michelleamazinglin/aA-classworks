require_relative "item.rb"
require_relative "list.rb"

class TodoBoard

    def initialize(label)
        @label = List.new(label)
    end

    def get_command
        print "\nEnter a command: "
        cmd, *args = gets.chomp.split(' ') # "cmd *arg *arg ...." = [cmd] [arg, arg...]
        # input = shop 2020/8/4 apple"
        #["shop" = cmd, ["2020/8/4", "apple"] =arg]

        case cmd
        when 'mktodo' #when cmd = mktodo
            @label.add_item(*args)
        when 'up'
            @label.up(*args)
        when 'down'
            @label.down(*args)
        when 'swap'
            @label.swap(*args)
        when 'sort'
            @label.sort_by_date!
        when 'priority'
            @label.print_priority
        when 'print'
            if args.empty?
                @label.print
            else
                @label.print_full_item(*args)
            end
        when 'quit'
            return false
        else
            print "Sorry, that command is not recognized."
        end
        true
    end

    def run
        while true 
            self.get_command
        end 
    end 

end