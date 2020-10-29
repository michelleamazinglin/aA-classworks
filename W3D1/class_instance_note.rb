class Fish

    @@all_fish = []
    #class:

    def self.random_lost_state
        [true, false].sample #.sample pylls out a random element from arr

    end

    def self.make_random_fish
        name = ""
        6.times do
            name << ("a".."z").to_a.sample #can range over alphabet, and to_a converts to arr
        end
        #self #what id a self here, in the context of a class methods? (class)
        self.new(name, self.random_lost_state) #works with the class name as well, but isnt dynamic for inherited methods (or id you change class methods)
        # a Salmon subclass would only be making a Fish instance, not a Salmon one
    end


    def self.all_fish #getter
        @@all_fish
    end

    #instance：

    # attr_reader :name #we create a getter so we can call on it
    # attr_writer :name
    attr_accessor :name #combination of two


    #def initialize(name,lost = Fish.random_lost_state) #if lost is not pass in, it will generate to the class method)
    def initialize(name,lost)
        @name = name
        @lost = lost #@ is a sumbol of setting up instance method
        #instance variable can not have a "?" at the end
        @@all_fish << self
    end

#       [12] pry(main)> load 'class_instance_note.rb'
#       => true
#       [13] pry(main)> nemo = Fish.new("Nemo",true)
#       => #<Fish:0x00007f8ff113dde0 @lost=true, @name="Nemo">
#       [14] pry(main)> nemo.name
#       NoMethodError: undefined method `name' for #<Fish:0x00007f8ff113dde0 @name="Nemo", @lost=true>
#       from (pry):12:in `__pry__'

#       fail cuz we dont have a getter method

    # def name   #getter
    #     @name
    # end

    # def name=(new_name)  #setter
    #     @name = new_name
    # end

    def lost? # lost store a boolean a variable
        # ruby style?convention says methods that return booleans sould end w/"?", so we cant not use suger syntax
        @lost
    end

    # custum methods

    def find
        @lost = false
    end


end