def partition(arr, num)
    part_inf = []
    part_sup =[]
    arr_fin = []
    arr.each do |nu|
        if nu < num
            part_inf << nu
        else
            part_sup << nu
        end
       
    end
    arr_fin << part_inf
    arr_fin << part_sup
    return arr_fin
end

def merge(hash_1, hash_2)
new_hash = Hash.new(0)
hash_1.each_key do |key|
    new_hash[key] = hash_1[key]
end
    hash_2.each_key do |key|
        new_hash[key] = hash_2[key]
    end
    return new_hash
end

def censor(str, arr)
str_splitted = str.split(" ")
vowels = "aeiouAEIOU"
arr_final = []

    str_splitted.each do |word|
        if arr.include?(word.downcase)
            str_final = ""
            word.each_char do |char|
                        
                            if vowels.include?(char)
                                str_final += "*"
                                else str_final += char
                            end
               
             end
             arr_final << str_final 
        else arr_final << word
        end

    end
    return arr_final.join(" ")
end


def power_of_two?(num)
    base = 2
    if num < 1
        return false
    end
    if num == 2 || num == 1
        return true
    end
    while base <= num
        if base == num
            return true
        else 
            base *= 2
        end
    end
    return false


end

