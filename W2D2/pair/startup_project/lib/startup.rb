require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(other_startup)
        return true if self.funding > other_startup.funding
        false
    end

    def hire(name, title)
        if self.valid_title?(title)
            employee = Employee.new(name, title)
            @employees << employee
        else
            raise "Title is not valid!"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        title = employee.title
        if @funding >= @salaries[title]
            employee.pay(@salaries[title])
            @funding -= @salaries[title]
        else
            raise "Not Enough Founding"
        end
    end

    def payday 
        @employees.each {|employee| self.pay_employee(employee)}
    end

    def average_salary
        salaries = []
        @employees.each do |employee|
            salaries << @salaries[employee.title]
        end
        salaries.sum / salaries.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup_2)
        @funding += startup_2.funding
        to_add = startup_2.salaries
        to_add.each do |title, salary|
            if !@salaries.has_key?(title)
                @salaries[title] = salary
            end
        end
        @employees += startup_2.employees
        startup_2.close
    end
end
