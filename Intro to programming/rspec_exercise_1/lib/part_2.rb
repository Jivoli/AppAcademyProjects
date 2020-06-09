def hipsterfy(word)
    vowel = "aeiou"
    reverse = word.reverse

    reverse.each_char.with_index do |char, idx|
        if vowel.include?(char)
            return (reverse[0...idx] + reverse[idx + 1..-1]).reverse!
        end
    end
return word
end

def vowel_counts(str)
    hash = Hash.new(0)
    vowel = "aeiou"
    str.each_char.with_index do |char, idx|
        if vowel.include?(char.downcase)
            hash[char.downcase] += 1
        end

    end

return hash
end

def caesar_cipher(str, num)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    new_str = ""
    str.each_char.with_index do |char, idx|
        index = alphabet.index(char)
        if alphabet.include?(char)
            new_str += alphabet[(index + num) % 26]
        else new_str += char
        end
    end
    return new_str

end

