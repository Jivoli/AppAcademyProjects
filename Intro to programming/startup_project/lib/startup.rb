require "employee"



class Startup

    attr_reader :name, :funding, :salaries
    attr_accessor :employees

    def initialize(arg_1, arg_2, arg_3)
        @name = arg_1
        @funding = arg_2
        @salaries = arg_3
        @employees = []
    end

    def valid_title?(arg)
        if @salaries.has_key?(arg) == true
           return true
        else
           return false
        end
  
   end

    def >(arg)
        if @funding > arg.funding
            return true
        end
        return false
    end

    def hire(employee_name, title)
        if valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else
            raise_error
        end
    end

    def size
        employees.length
    end

    def pay_employee(arg)

        if @funding > @salaries[arg.title]
            arg.pay(@salaries[arg.title])
            @funding -= @salaries[arg.title]
        else
            raise_error
        end
    end

    def payday
        @employees.each do |arg|
            pay_employee(arg)
        end
    end

    def average_salary
        count = 0
        @employees.each {|arg| count += @salaries[arg.title]}
        return count / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(arg)
        @funding += arg.funding
        @salaries = arg.salaries.merge(@salaries)
        arg.employees.each do |word|
            @employees << word
        end
        arg.close
    end




end
