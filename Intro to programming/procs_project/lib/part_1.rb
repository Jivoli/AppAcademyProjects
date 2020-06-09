def my_map(arr, &prc)
    final_arr = []
    arr.each do |ele|
    final_arr << prc.call(ele)
    end
    return final_arr
end

def my_select(arr, &prc)
final_arr = []
arr.each do |ele|
    final_arr << ele if prc.call(ele)
end
final_arr
end

def my_count(arr, &prc)
    count = 0
    arr.each do |ele|
        count += 1 if prc.call(ele)
    end
    count
end

def my_any?(arr, &prc)
    arr.each do |ele|
        return true if prc.call(ele)
    end
    return false
end

def my_all?(arr, &prc)
    arr.each do |ele|
    return false if !prc.call(ele)
end
return true
end
    
def my_none?(arr, &prc)
    arr.each do |ele|
        return false if prc.call(ele)
    end
    return true
end