def duos(sent)
    counter = 0
    (0...sent.length).each do |num|
        if sent[num] == sent [num+1]
            counter += 1
        end
    end
    counter
end


# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

def sentence_swap(sent, hash)
    sentsplit = sent.split(" ")
    sentsplit.map! do |ele| 
        ele = hash[ele] if hash.has_key?(ele)
        ele
    end
    sentsplit.join(" ")
end

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'
def hash_mapped(hash, block, &prc)
    final_hash = {}
    hash.each do |k,v|
        final_hash[prc.call(k)] = block.call(v)
    end

final_hash
end

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}

def counted_characters(sent)
    hash = Hash.new(0)
    final_arr = []
    sent.each_char do |word|
        word.each_char do |char|
            hash[char] += 1
        end
    end

    hash.each do |k, v|
       final_arr << k if v > 2
    end

 
final_arr

end


# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []

def triplet_true(str)
    return false if str.length < 3
    (0...str.length - 1).each do |num|
       return true if (str[num] == str[num + 1]) && (str[num] == str[num + 2])
    
    end
    return false
end

# p triplet_true('caaabb')        # true
# p triplet_true('terrrrrible')   # true
# p triplet_true('runninggg')     # true
# p triplet_true('bootcamp')      # false
# p triplet_true('e')             # false

def energetic_encoding(str, hash)
    new_str = str.split("")
    new_str.map! do |char|
        if hash.has_key?(char)
            char = hash[char]
        elsif char == " "
            char = char
        else
            char = '?'
        end
    end
    return new_str.join("")
end

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'

def uncompress(str)
    strsplit = str.split("")
    nums = "0123456789"
    final_str = []
    strsplit.each.with_index do |char, idx|
        if nums.include?(char)
            integre = char.to_i
            integre.times { final_str << strsplit[idx - 1]}
        end
    end
    final_str.join("")
end
    


# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

def conjunct_select(arr, *prc)
    final_arr = []
    arr.each do |ele|
        counter = 0
        prc.each do |procc|
            counter +=1 if procc.call(ele)
        end
        final_arr << ele if counter == prc.length
    end
    final_arr
end

is_positive = Proc.new { |n| n > 0 }
is_odd = Proc.new { |n| n.odd? }
less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

def modify_word(word)
arr = []
word.each_char.with_index do |char, idx|
    vowels = "aeiou"
    if vowels.include?(char)
        arr << idx
    end 
end
    i = arr[0]
    final_word = []
    final_word << word[i..-1] + word[0...i]
    final_word << "a"
    final_word << "y"
    return final_word.join("")
end

def convert_pig_latin(sent)
    sentsplit = sent.split(" ")
    final_sent = []
    vowels = "aeiou"
    sentsplit.each do |word|
        if word.length < 3
            final_sent << word
        end
        if word.length >= 3
            if word.capitalize == word
                if vowels.include?(word[0])
                    word_mod = word.downcase + 'yay'
                    final_sent << word_mod.upcase
                elsif !vowels.include?(word[0])
                        final_sent << (modify_word(word.downcase).capitalize)
                end
            elsif word.capitalize != word
                if vowels.include?(word[0])
                    word_mod = word + 'yay'
                    final_sent << word_mod
                elsif !vowels.include?(word[0])
                        final_sent << modify_word(word)
                end
            end
        end
    end
    return final_sent.join(' ')

end

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"
# p modify_word("bananas")
def translate_word(word)
    vowels = "aeiouAEIOU"
    if vowels.include?(word[-1])
        return word * 2
    end
    (0...word.length).reverse_each do |i|
        if vowels.include?(word[i])
            return word + word[i..-1]
        end
    end


end
require "byebug"
def reverberate(sent)
    reverb = sent.split(" ")
    new_words = reverb.map do |word|
        new_word = word.length > 2 ? translate_word(word) : word
        new_word = word == word.capitalize ? new_word.capitalize : new_word
    end
    new_words.join(" ")

end

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"
# p translate_word("family")
# p translate_word("France")

def disjunct_select(arr, *prc)
    final_arr = []
    arr.each do |word|
        final_arr << word if prc.any?{|prc| prc.call(word)}
    end
    final_arr

end
longer_four = Proc.new { |s| s.length > 4 }
contains_o = Proc.new { |s| s.include?('o') }
starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]
# def has_vowels?(word)
#     vowels = "aeiou"
#     word.each_char do |char|
#         return true if vowels.include?(char)
#     end
#     return false

# end

# def first_vowel(word)
#     vowels = "aeiou"
#     (0...word.length).each do |i|
#         if vowels.include?(word[i])
#             return word[0...i] + word[i+1..-1]
#         end
#     end
# end

# def last_vowel(word)
#     vowels = "aeiou"
#     (0...word.length).reverse_each do |i|
#         if vowels.include?(word[i])
#             return word[0...i] + word[i+1..-1]
#         end
#     end
# end

# def alternating_vowel(sent)
#     sentsplit = sent.split(" ")
#     vowels = "aeiou"

#     new_words = sentsplit.map.with_index do |word, i|
#         if has_vowels?(word)
#             if i.even?
#                 first_vowel(word)
#             else
#                 last_vowel(word)
#             end
#         else
#             word

#         end
#     end
#     new_words.join(" ")
# end

        

# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"
def sillytransform(word)
    indexes = []
    vowels = "aeiouAEIOU"
    new_word = word.each_char.map do |ele|
        if vowels.include?(ele)
            new_char = ele + "b" + ele 
            else
            new_char = ele
        end

    end
    new_word.join("")
end



def silly_talk(sent)
    vowels = "aeiouAEIOU"
    sentsplit = sent.split(" ")
    new_words = sentsplit.map do |word|
        if vowels.include?(word[-1])
            new_word = word + word[-1]
        else
            new_word = sillytransform(word)
        end
    end
    new_words.join(" ")
end

# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

# p sillytransform("stop")
def consecutive(word)
    (0...word.length - 1).each do |i|
        return true if word[i] == word[i+1]
    end
    return false
end

def compression(word)
    return word if !consecutive(word)
    idxs = []
    (0...word.length - 1).each do |i|
        if word[i] == word[i+1]
            idxs << i
        end
    end
    j = idxs[0]
    while word[j] == word[j+1]
        j += 1
    end
    k = j - idxs[0]
    final_word = word[0..idxs[0]] + (k + 1).to_s + word[j + 1..-1]
    return compression(final_word)

end


def compress(word)

    
compression(word) 

end



p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"