require_relative './employee.rb'
class Manager < Employee
    attr_accessor :employees
    def initialize(name,title,salary,boss)
        super(name, title, salary, boss)
        @employees = []
    end


    def bonus(multiplier)
        bonus = 0
        @employees.each do |employee|
            bonus += employee.salary * multiplier
        end
        bonus
    end

    def hire(employee) #employee object
        @employees << employee
    end
end