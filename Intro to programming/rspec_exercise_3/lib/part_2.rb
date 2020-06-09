def element_count(arr)
    final_hash = Hash.new(0)
    arr.each do |ele|
        final_hash[ele] += 1
    end
    final_hash

end

def char_replace!(str, hash)
    str.each_char.with_index do |char, idx|
        if hash.has_key?(char)
            str[idx] = hash[char]
        end
    end
end

def product_inject(arr)
    arr.inject{|acc, ele| acc * ele}
end