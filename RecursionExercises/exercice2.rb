require "byebug"
def range(start, ending)
    return [] if start > ending
    range(start, ending - 1) << ending
end

def recursive_sum(arr)
    return arr[0] if arr.length == 1
    arr[0] += recursive_sum(arr[1..-1])
end

def iterative_sum(arr)
    arr.inject {|acc, ele| acc += ele}
end

def exp(num, pow)
    return 1 if pow == 0
    num * exp(num, pow - 1)
end

def exp2(num, pow)
    return 1 if pow == 0
    return num if pow == 1
    if pow % 2 == 0
        exp2(num, pow / 2) ** 2
    else
        num * (exp2(num, (pow-1) / 2) ** 2)
    end
end

def deep_dup(arr)
    
    final_arr = []
    arr.each do |subarr|
        if subarr.is_a?(Array)
            final_arr << deep_dup(subarr)
        else
            final_arr << subarr
        end
    end
    final_arr
end

def fibonacci(num)
    raise if num < 0
    return 0 if num == 0
    return 1 if num == 1 || num == 2
    fibonacci(num-1) + fibonacci(num-2)

end

def bsearch(arr, num)
    return nil if arr.empty?

    middle = arr.length / 2
    arr_left = arr[0...middle]
    arr_right = arr[middle + 1 ..-1]
    return middle if num == arr[middle]

    if num < arr[middle]
        bsearch(arr_left, num)
    else
        bsearch(arr_right, num).nil? ? nil : middle + 1 + bsearch(arr_right, num)
    end


end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(arr)
    return arr if arr.length < 2
    middle = arr.length / 2
    half1 = arr[0...middle]
    half2 = arr[middle..-1]
    merge(merge_sort(half1), merge_sort(half2))
end

def merge(arr1, arr2)
    merged_arr = []
    until arr1.empty? || arr2.empty?
        if arr1.first < arr2.first
            merged_arr << arr1.shift
        else
            merged_arr << arr2.shift
        end
    end

    merged_arr + arr1 + arr2

end

def subsets(arr)
return [[]] if arr.empty?

subsets(arr[0...-1]) + subsets(arr[0...-1]).map {|ele| ele + [arr[-1]] }
end

def permutations(arr)
    return [arr] if arr.length <= 1

    all_perms = []
    last = arr.last
    perms = permutations(arr[0...-1])
    
    perms.each do |perm|
        (0..perm.length).each do |i|
           all_perms << perm[0...i] + [last] + perm[i..-1]
        end
    end

    all_perms
end

def greedy_make_change(num, coins)
    coin = coins.shift
    rest = num % coin
    final_count = []
    if rest == 0
        (num / coin).times {final_count << coin}
        return final_count
    else
        (num / coin).times {final_count << coin}
        final_count += greedy_make_change(rest, coins)
        final_count
    end


end

def make_better_change(num, coins)
    return [] if target == 0

    return nil if coins.none? { |coin| coin <= num}

    best_change = nil

    coins.each.with_index do |coin, i|
        next if coin > num

        remainder = num - coin

        


end