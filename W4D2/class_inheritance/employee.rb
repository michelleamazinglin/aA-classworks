require_relative './manager.rb'
class Employee
    #return the employee's name, title, salary, and boss.
    attr_reader :name, :title, :salary, :boss
  
    def initialize(name, title, salary, boss)
        @name = name
        @salary = salary
        @title = title
        @boss = boss
    end

    def boss=(boss)
        @boss = boss
        @boss.employees << self
    end

    def bonus(multiplier)
        bonus = (self.salary) * multiplier
    end
end

# ray = Employee.new(ray, student, 100, michelle)
# michelle = Manager.new(michelle, bigboss, 1000, boss=nil)