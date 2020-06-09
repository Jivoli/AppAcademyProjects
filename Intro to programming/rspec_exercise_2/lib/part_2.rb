def palindrome?(str)
    i = 0
while i <= str.length / 2
    if str[i] == str[-1 - i]
        i += 1
    else
        return false
    end
end
return true
end

def substrings(word)
    arr = []
 word.each_char.with_index do |char, idx|
    i = idx
    while i <= word.length - 1
        arr << word[idx..i]
        i += 1
    end
    
end
return arr
end

def palindrome_substrings(str)
 new_arr = substrings(str)
 final_arr = []
 new_arr.each do |word|
    if palindrome?(word) == true && word.length > 1
        final_arr << word
    end
 end
 return final_arr
end

p palindrome_substrings("abracadabra")