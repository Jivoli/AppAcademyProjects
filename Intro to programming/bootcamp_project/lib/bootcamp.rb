require "byebug"
class Bootcamp
  
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students=[]
        @grades = Hash.new {|h,k| h[k] = Array.new }
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

def hire(arg)
    @teachers.push(arg)
end

def enroll(arg)
    if @students.length >= @student_capacity
        return false
    else
        @students.push(arg)
        return true
    end
end

    def enrolled?(arg)
        @students.each do |ele|
            if ele.include?(arg)
                return true
            end
        end
        return false
    end

    def student_to_teacher_ratio
return (@students.length / @teachers.length).round()
    end

    def add_grade(stud, arg)
        @students.each do |ele|
            if ele.include?(stud)
                @grades[stud] << arg
                return true
            end
        end
        return false
    end

    def num_grades(stud)
        return @grades[stud].length
    end

def average_grade(stud)
    if @grades[stud].length > 0
        return (@grades[stud].sum / @grades[stud].length ).round()
    else
        return nil
    end
end

end