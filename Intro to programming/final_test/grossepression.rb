require "byebug"
def no_dupes?(arr)
        final_arr = []
    hash_counter = Hash.new(0)
    arr.each do |ele|
        hash_counter[ele] += 1
    end
    hash_counter.each do |k, v|
        if v == 1
            final_arr << k
        end
    end
    final_arr

end

    #p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
    #p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
    #p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
    if arr.length == 1
        return true
    end
    (0...arr.length - 1).each do |idx|
    if arr[idx] == arr[idx + 1]
        return false
        
    end
end
    return true
end



# no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
    final_hash = Hash.new([])
    str.each_char.with_index do |char, idx|
        
        final_hash[char] += [idx]
    end
    final_hash


end

#p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
#p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
    max_counter = ""
    if str.length < 2
        return str
    end
    i = 0
    while i < str.length 
        counter = 1
        while str[i] == str[i+1]
            counter += 1
            i +=1
        end
        if counter >= max_counter.length
            max_counter = ""
            counter.times {max_counter += str[i]}
        end
        i += 1
    end

    return max_counter
end



#longest_streak('a')           # => 'a'
# longest_streak('accccbbb')    # => 'cccc'
# longest_streak('aaaxyyyyyzz') # => 'yyyyy
# longest_streak('aaabbb')      # => 'bbb'
# longest_streak('abc')         # => 'c'

def bi_prime?(num)
    
    factors = primes?(num)
    (0...factors.length - 1).each do |idx1|
        (idx1...factors.length).each do |idx2|
            if factors[idx1] * factors[idx2] == num
                return true
            end
        end
    end
    return false    
end

def primes?(num)
    final_arr = []

    (2...num).each do |number|
        if prime?(number)
            final_arr << number
        end

    end

    return final_arr
end

def prime?(num)
    if num == 2
        return true
    end
    (3...num).each do |numero|
        if num % numero == 0
            return false
        end
    end
    return true

end

#p bi_prime?(14)   # => true
#p bi_prime?(22)   # => true
#p bi_prime?(25)   # => true
#p bi_prime?(94)   # => true
#p bi_prime?(24)   # => false
#p bi_prime?(64)   # => false

def vigenere_cipher(str, arr)
    final_str = ""
    str.each_char.with_index do |char, idx|
        if idx < arr.length
        final_str += keyage(char, arr[idx])
        else
            final_str += keyage(char, arr[idx % arr.length])
        end
    end
    return final_str
end

def keyage(char, key)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    num = alphabet.index(char) + key
    return alphabet[num % 26]

end

# vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(str)
vowels = "aeiou"
    i = 0
    while !vowels.include?(str[i])
        i += 1
    end
    j = str.length - 1
    while !vowels.include?(str[i])
        j -= 1
    end

    array = str.split("")
    array[i], array[j] = array[j], array[i]

    return array.join("")
    


end

#p vowel_rotate('computer')      # => "cempotur"
#p vowel_rotate('oranges')       # => "erongas"
#p vowel_rotate('headphones')    # => "heedphanos"
#p vowel_rotate('bootcamp')      # => "baotcomp"
#p vowel_rotate('awesome')       # => "ewasemo"

class String

    def select(&prc)
        if prc == nil 
            return ""
        end
        final_str = ""
        self.each_char do |char|
            final_str += char if prc.call(char)
        end
        final_str
    end

    def map(prc)
        self.each_char.with_index do |char, idx|
            str[idx]= prc.call(char, idx)
        end
    end

end

#p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
#p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
#p "HELLOworld".select          # => ""

def multiply(num1, num2)
    return 0 if num1 == 0
    if num1 < 0 && num2 < 0
    return -num2 + multiply(num1 + 1, num2)
    elsif num1 < 0
    return num2 + multiply(num1 + 1, num2)
    else
    return num2 + multiply(num1 - 1, num2)
    end
end

#p multiply(3, 5)        # => 15
#p multiply(5, 3)        # => 15
#p multiply(2, 4)        # => 8
#p multiply(0, 10)       # => 0
#p multiply(-3, -6)      # => 18
#p multiply(3, -6)       # => -18
#p multiply(-3, 6)       # => -18

def lucas_sequence(num)

return [] if num ==0
return [2] if num == 1
return [2,1] if num == 2
final_arr = lucas_sequence(num - 1)
final_arr << lucas_sequence(num - 1)[-1] + lucas_sequence(num - 2)[-1]

end

#p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
#p lucas_sequence(8)

def prime_factorization(num)
    return [2] if num == 2
    
    arr = primes?(num)
    arr.reverse.each do |numero|
        final_arr = prime_factorization(numero)
        if numero * prime_factorization(numero)[-1] == num
            
            final_arr << numero
        end
    end
    return final_arr
end

p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]
