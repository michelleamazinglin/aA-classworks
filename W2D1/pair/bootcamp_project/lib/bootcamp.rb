class Bootcamp
  
    def initialize(name,slogan,student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new{|h,k| h[k] = count]} #h = count, k = name
        #Hash.new is different than hash.each do
        #Hash.new(you try to create a new hash from empty)
        #h is name of hash
        #k is k
        #whatever after the = is the value
    end

    def name
        @name
    end

    def slogan
        @slogan
    end

    def teachers
        @teachers
    end

    def students
        @students
    end

    def hire(teacher)
        @teachers << teacher
    end

    def enroll(student)
        if @students.length < @student_capacity
            @students << student
            return true
        else
            return false
        end
    end

    def enrolled?(student)
        @students.include?(student)
    end

    def student_to_teacher_ratio
        @students.length / @teachers.length
    end

    def add_grade(student,grade)
        # @grades.each {|k,v| @grades[student] << grade}
        if enrolled?(student)
            @grades[student] << grade
            return true 
        end
        return false if !enrolled?(student)
    end

    def num_grades(student)
        # @grades[student].length
        return @grades[student].length if @grades.has_key?(student)
    end

    def average_grade(student)
        return nil if @grades[student].length == 0
        @grades[student].sum / @grades[student].length
    end

    

end

