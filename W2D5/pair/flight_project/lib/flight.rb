class Flight
    attr_reader :passengers

    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def full?
        if @passengers.length >= @capacity
            return true 
        else 
            return false
        end 
    end 

    def board_passenger(pass_obj) #jasmine = Passenger.new(...)
        if !full? && pass_obj.has_flight?(@flight_number)
            @passengers << pass_obj
        end
    end

    def list_passengers #@passenger = [Jasmine(instance), Michelle(instance)]
        @passengers.map {|pass_obj| pass_obj.name}
    end 

    def [](ind)
        @passengers[ind]
    end 

    def <<(pass_obj)
        self.board_passenger(pass_obj)
    end


end