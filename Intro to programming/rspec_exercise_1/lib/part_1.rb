def average(num_1, num_2)
return (num_1 + num_2) / 2.0
end

def average_array(arr)
   
    return arr.inject { |acc, ele| acc + ele} / (arr.length * 1.0)
 
end

def repeat(str, number)
    string = ""
    number.times do 
        string += str
    end
    return string
end

def yell(str)
    return str.upcase + "!"
end

def alternating_case(str)
    arr = str.split(" ")
    string = []
    arr.each.with_index do |ele, ind|
        if ind == 0 || ind % 2 == 0
            string << ele.upcase
            else string << ele.downcase
        end


    
    end
    return string.join(" ")
end

