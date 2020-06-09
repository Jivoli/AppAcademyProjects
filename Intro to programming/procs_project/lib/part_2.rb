
def reverser(str, &prc)
    p prc.call(str.reverse)
end

def word_changer(str, &prc)
words = str.split(" ")
return words.map { |ele| prc.call(ele)}.join(" ")
end

def greater_proc_value(num, proc1, proc2)
return [proc1.call(num), proc2.call(num)].max
end

def and_selector(arr, proc1, proc2)
final_arr = []
    arr.each do |num|
        if proc1.call(num) && proc2.call(num)
            final_arr << num
        end
    end
    return final_arr
end

def alternating_mapper(arr, proc1, proc2)
    new_arr = []
arr.each_with_index do |ele, idx|
    if idx % 2 == 0
        new_arr << proc1.call(ele)
    else
        new_arr << proc2.call(ele)
    end
end
new_arr
end
    
