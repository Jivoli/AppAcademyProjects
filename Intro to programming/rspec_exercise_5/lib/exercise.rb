require "byebug"

def zip(*arrays)
    length = arrays.first.length
    (0...length).map do |i|
        arrays.map { |array| array[i] }
    end
end

def prizz_proc(arr, proc1, proc2)
    final_arr = []
    arr.each do |ele|
        if (!proc1.call(ele) && proc2.call(ele)) || (proc1.call(ele) && !proc2.call(ele))
            final_arr << ele
        end
    end
    final_arr
end

def zany_zip(*arr)
    length = arr.map(&:length).max

    (0...length).map do |i|
        arr.map { |array| array[i] }
    end

end 

def maximum(arr, &prc)
    return nil if arr.nil?
    result = arr[0]
    (1...arr.length).each do |ele|
        if prc.call(result) <= prc.call(arr[ele])
            result = arr[ele]
        end
    end
    result
end

def my_group_by(arr, &proc)
    final_hash = Hash.new { |k,v| k[v] = [] }
    arr.each do |ele|
        final_hash[proc.call(ele)] << ele
    end
    final_hash


end

def max_tie_breaker(arr, prc, &block)
    return nil if arr.nil?
    result = arr.first
    arr.each do |el|
        result_el = block.call(el)
        result_res = block.call(result)
        if result_el > result_res
            result = el
        elsif result_el == result_res && prc.call(el) > prc.call(result)
            result = el

        end
    end
    result
 
    

end

def silly_syllables(str)
    words = str.split(" ")
    two_vowels =  []
    vowels = "aeiou"

    words.each do |word|
        first_indice = nil
        last_indice = 0
        counter = 0
        word.each_char.with_index do |char, idx|
            if vowels.include?(char)
                counter += 1
                first_indice = idx if first_indice.nil?
                last_indice = idx if !first_indice.nil?
            end
        end
        if counter >= 2
            two_vowels << word[first_indice..last_indice]
        else
            two_vowels << word
        end
    end
    two_vowels.join(" ")

end