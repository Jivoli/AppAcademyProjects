def is_prime?(num)
    if num < 2
        return false
    end
    return true if num == 2
    (2...num).each do |number|
        if num % number == 0
            return false
        end
    end

    return true
end

def nth_prime(num)
    count = 0
    nth_prime = 0
    i = 0
    while count < num
        count += 1 if is_prime?(i)
        nth_prime = i if is_prime?(i)
        i +=1
    end
    return nth_prime


end

def prime_range(min, max)
    arr = []
    (min..max).each do |num|
        arr << num if is_prime?(num)
    end
    arr


end