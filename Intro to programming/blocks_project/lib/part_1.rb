
def select_even_nums(arr)
    final_arr = []
    arr.select(&:even?)
end

def reject_puppies(arr)
   arr.reject{ |ele| ele["age"] <= 2}

end

def count_positive_subarrays(arr)
arr.count{|ele| ele.sum > 0}
end

def aba_translate(word)
    vowels = "aeiou"
    final_word = ""
word.each_char.map do |ele|
  
    if vowels.include?(ele)
        final_word += ele + "b" + ele
    else
        final_word += ele
    end
end
return final_word
end

def aba_array(arr)
arr.map{ |ele| aba_translate(ele) }
end