require "byebug"
class WordChainer
    attr_reader :dictionary, :all_seen_words

    def initialize(dictionary = 'dictionary.txt')
        leslignes = File.readlines('dictionary.txt')
        arr = []
        leslignes.each do |line|
            arr << line.chomp
        end
        @dictionary = arr.to_set

    end

    def adjacent_words(word)
        same_length = @dictionary.select { |words| words.length == word.length}
        adj_words = []
        (0...word.length).each do |i|
            same_length.each do |words|
                if word[0...i] == words[0...i] && word[i + 1..-1] == words[i + 1..-1]
                    adj_words << words
                end
            end
        end
        adj_words
    end

    def run(source, target)
        @current_words = [source]
        @all_seen_words = { source => nil }
        until @current_words.empty?
            @current_words = self.explore_current_words(target)
            break if @all_seen_words.has_key?(target)
        end
        self.build_path(target)

    end

    def explore_current_words(target)
     new_current_words = []
        @current_words.each do |current_word|
            adjacent_words(current_word).each do |word|
                next if @all_seen_words.has_key?(word)
                @all_seen_words[word] = current_word
                new_current_words << word
            end
        end
        new_current_words.each do |new_word|
            p "#{new_word} : #{@all_seen_words[new_word]}"
        end

    end

    def build_path(target)
        path = [target]
        return nil if !@all_seen_words.has_key?(target)
        until path.include?(nil)
            path << @all_seen_words[path.last]
        end
        return path[0...-1].reverse
    end


end