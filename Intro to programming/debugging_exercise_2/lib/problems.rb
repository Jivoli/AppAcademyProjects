# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
(2..num).reverse_each do |numero|
    if factor(numero) && num % numero == 0
        return numero
    end
end
return 1
end


def factor(numero)
    (2...numero).each do |new_num|
        if numero % new_num == 0
            return false
        end
    end
    return true

end

def unique_chars?(str)
    hash = Hash.new(0)
    str.each_char do |char|
        hash[char] += 1
    end
hash.each_value do |value|
    if value > 1
        return false
    end
end
return true

end

def dupe_indices(arr)
hash = Hash.new(0)
arr.each.with_index do |char, idx|
    if hash.has_key?(char)
    hash[char] << idx
    else 
        hash[char] = [idx]
    end
end
hash.each_key do |k|
    if hash[k].length == 1
        hash.delete(k)
    end
end
return hash

end

def ana_array(arr1, arr2)
hash1 = Hash.new(0)
hash2 = Hash.new(0)

arr1.each do |item|
    hash1[item] += 1
end

arr2.each { |item| hash2[item] += 1}

hash1 == hash2


end