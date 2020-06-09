    require "byebug"
class Array

    def my_each(&block)
        self.length.times do |i|
            block.call(self[i])
        end

        self
    end

    def my_select(&prc)
        final_arr = []
        self.my_each {|i| final_arr << i if prc.call(i)}
        final_arr
    end

    def my_reject(&prc)
        final_arr = []
        self.my_each {|i| final_arr << i if !prc.call(i)}
        final_arr
    end

    def my_any?(&prc)
        final_arr = []
        self.my_each {|i| final_arr << i if prc.call(i)}
        return true if final_arr.length > 0
        return false
    end

    def my_all?(&prc)
        final_arr = []
        self.my_each {|i| final_arr << i if prc.call(i)}
        return true if final_arr.length == self.length
        return false
    end

    def my_flatten
        flattened = []
        self.my_each do |ele|
            if ele.is_a?(Array)
                flattened.concat(ele.my_flatten)
            else
                flattened << ele
            end
        end
        flattened

    end

    def my_zip(*args)
        length = args.length + 1
        final_arr = Array.new(self.length) {Array.new([])}

        (0...self.length).to_a.my_each do |i|

            final_arr[i] << self[i]

            args.my_each do |arg|
                if arg[i].nil?
                    final_arr[i] << nil
                else
                    final_arr[i] << arg[i]
                end
            end
        
        end

        
        

        final_arr


    end

    def my_rotate(num = 1)
        final_arr = []
        (0...self.length).to_a.my_each do |i|
                final_arr << self[(num + i) % self.length]
        end
        final_arr
    end

    def my_join(arg = "")
        self.join(arg)
    end

    def my_reverse
        final_arr = []
        (0...self.length).to_a.reverse.my_each do |i|
            final_arr << self[i]
        end
        final_arr
    end

    def bubble_sort(&prc)
        sorted = false

        while !sorted
            sorted = true
            i = 0
            while i < self.length - 1
                if prc.call(self[i], self[i+1]) == 1
                    self[i], self[i+1] = self[i+1], self[i]
                    sorted = false
                end
                i += 1
                
            end


        end
        self
    end

    def bubble_sort!(&prc)
        sorted = false
        b = self.dup
        while !sorted
            sorted = true
            i = 0
            while i < b.length - 1
                if prc.call(b[i], b[i+1]) == 1
                    b[i], b[i+1] = b[i+1], b[i]
                sorted = false
                end
                i += 1
                
            end


        end
        b
    end

    
end

def factors(num)
    final_arr = []
    (1..num).each do |n|
        final_arr << n if num % n == 0
    end
    final_arr
end

def substrings(string)
    length = string.length - 1
    final_arr = []
    string.each_char.with_index do |char, i|
        (0..length).each do |j|
            if string[i..j] != "" && !final_arr.include?(string[i..j])
                final_arr << string[i..j]
            end
        end
    end
    final_arr


end

def subwords(string, dictionary)
    length = string.length - 1
    final_arr = []
    string.each_char.with_index do |char, i|
        (0..length).each do |j|
            if string[i..j] != "" && !final_arr.include?(string[i..j])
                dictionary.each do |word|
                    if word == string[i..j]
                    final_arr << string[i..j]
                    end
                end
            end
        end
    end
    final_arr

end

def doubler(array)
    final_arr = []
    array.each do |num|
        final_arr << num * 2
    end
    final_arr
end

