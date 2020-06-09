def proper_factors(num)
    final_arr = []
    (1...num).each do |numero|
        final_arr << numero if num % numero == 0
    end
    final_arr
end

def aliquot_sum(num)
    proper_factors(num).sum

end

def perfect_number?(num)
aliquot_sum(num) == num

end

def ideal_numbers(n)
    final_arr = []
    i = 1
    while final_arr.length < n
       final_arr << i if perfect_number?(i)
       i += 1
    end
    final_arr
end