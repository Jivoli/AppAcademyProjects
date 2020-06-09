require './card.rb'

class Board
    VALUES = ("A".."Z").to_a
    attr_reader :grid

    def initialize(size = 4)
        @grid = Array.new(size) {Array.new(size)}
        self.populate
    end

    def shuffle_pairs(num_pairs)
        values = VALUES
        i = values.length
        while i < num_pairs
            values = values + values
        end

        pairs = values.shuffle.take(num_pairs) * 2
        pairs.shuffle!
        pairs.map! {|ele| ele = Card.new(ele)}
    end

    def populate
        num_pairs = @grid.length ** 2 / 2
        pairs = shuffle_pairs(num_pairs)
        @grid.each do |row|
            row.map! { |ele| ele = pairs.pop}
        end

    end

    def render
        puts (0..@grid.length).to_a.join(' ')
        @grid.each_with_index do |row, i|
            puts "#{i} #{row.join(' ')}"
        end
    end

    def [](pos)
        row, col = pos
        @grid[row][col] 
    end

    def []=(pos, value)
        row, col = pos
        @grid[row][col] = value
    end

    def won?
        @grid.each do |row|
            return false if !row.all? { |ele| ele.reveal?}
            return true
        end
    end

    def reveal(guessed_pos)
        row, col = guessed_pos
        @grid[row][col]
    end




end