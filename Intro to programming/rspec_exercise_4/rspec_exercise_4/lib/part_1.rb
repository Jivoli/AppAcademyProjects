
def my_reject(arr, &prc)
    final_arr = []
    arr.each do |ele|     
        final_arr << ele if !prc.call(ele)
    end
    final_arr
end

def my_one?(arr, &prc)
    count = 0
    arr.each do |ele|
        count += 1 if prc.call(ele)
    end
    if count == 1
        return true
    end
    return false

end

def hash_select(hash, &prc)
    final_hash = Hash.new(0)
    hash.each do |k,v|
        if prc.call(k, v)
            final_hash[k] = v
        end
    end
    return final_hash

end

def xor_select(arr, proc1, proc2)
    final_arr = []
    arr.each do |ele|
        final_arr << ele if (proc1.call(ele) && !proc2.call(ele)) || (!proc1.call(ele) && proc2.call(ele))
    end
    return final_arr
end

def proc_count(val, arr)
    count = 0
    arr.each do |proc|
        count += 1 if proc.call(val)
    end
    count

end