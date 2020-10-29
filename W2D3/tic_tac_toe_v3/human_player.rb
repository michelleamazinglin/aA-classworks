
class HumanPlayer

    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position
        puts "Enter 2 nums with a space"
        input = gets.chomp.split(" ")
        input.map! {|el| el.to_i}
        if input.length != 2
            raise "invalid"
        end
        return input
    end

end