class Dog

    attr_reader :name, :age #getter
    attr_writer :age #setter

    def initialize(name, age, fav_food)
        @name = name
        @age = age
        @fav_food = fav_food
    end

end


my_dog = Dog.new("miumiu","2","fish")
p my_dog.name

my_dog.age = 3
p my_dog.age