def all_words_capitalized?(arr)
    arr.all?{ |ele| ele == ele.capitalize}

end

def no_valid_url?(arr)
    val1 = ".com"
    val2 = ".net"
    val3 = ".io"
    val4 = ".or"
    val5 = ".org"
    arr.none?{|ele| ele.include?(val1) || ele.include?(val2) || ele.include?(val3) || ele.include?(val4) || ele.include?(val5) }

end

def any_passing_students?(arr)
    arr.any? do |ele|
        if ele[:grades].sum / ele[:grades].length >= 75
            return true
        end
    end
end