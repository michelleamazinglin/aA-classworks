require_relative "room"

class Hotel
  
    attr_reader :rooms

    def initialize(name, hash)
        @name = name
        @rooms = Hash.new
        hash.each do |room_name, capacity|
            @rooms[room_name] = Room.new(capacity)
        end
    end

    def name
        words = @name.split(" ")
        words.map! {|word| word.capitalize}
        words.join(" ")
    end

    def room_exists?(name)
        @rooms.has_key?(name)
    end

    def check_in(person,room_name)
        if !self.room_exists?(room_name)
            puts "sorry, room does not exist"
        else
            if @rooms[room_name].add_occupant(person)
                puts "check in successful"
            else
                puts "sorry, room is full"
            end
        end
    end

    def has_vacancy?
        rooms = @rooms.values
        rooms.each do |room|
            return true if !room.full?
        end
        false
    end

    def list_rooms
        @rooms.each do |room_name, room_object|
            puts room_name + ": " + room_object.available_space.to_s
        end
    end
    
end
