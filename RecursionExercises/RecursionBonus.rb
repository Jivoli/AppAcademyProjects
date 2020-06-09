def integer_sum(arr)
    return arr[0] if arr.length <= 1
    arr.first + integer_sum(arr.drop(1))
end

def lookfor(arr, v)
    return false if arr.length < 1
    return true if arr.first == v
    lookfor(arr.drop(1), v)      
end

def valuecounter(arr, val)
  return 0 if arr.empty?
  count = 0
  count += 1 if arr.first == val
  count + valuecounter(arr.drop(1), val)
end

def value_sum?(arr)
    return false if arr.length < 2
    return true if arr[0] + arr[1] == 12
    value_sum?(arr.drop(1))
end

def arr_sorted?(arr)
    return true if arr.length <= 1
    return false if arr[0] > arr[1]
    arr_sorted?(arr.drop(1))
end

def reverse_str(str)
    return "" if str.empty?
    str[-1] + reverse_str(str[0...-1])
end