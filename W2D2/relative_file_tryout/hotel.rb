
require_relative "./cat.rb"

class Pethotel
    def initialize(name)
        @name = name
        @guests = []
    end

    def get_guest
        @guests
    end

    def check_in(guest)
        @guests << guest
    end
end


hotel = Pethotel.new("Animal Inn")

cat1 = Cat.new("miumiu")
cat2 = Cat.new("biubiu")

hotel.check_in(cat1)
hotel.check_in(cat2)

p hotel.get_guest
p Hi