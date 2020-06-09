require "./tile.rb"

class Board
    require "byebug"
    attr_reader :grid
    def initialize
        p "Chose the name of the txt sudoku"
        @grid = []
        File.readlines(STDIN.gets.chomp + '.txt').each do |line|
            arr_line = line.chomp.split('')
            @grid << arr_line.map do |i|
                if i == '0'
                    i = Tile.new
                else
                    i = Tile.new(Integer(i), true)
                end
            end
        end
    end        


    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, value)
        row, col = pos
        @grid[row][col].change_value(value)
    end

    def render
        puts "  #{(0..8).to_a.join(' ')}"
        self.grid.each_with_index do |line, i|
            puts "#{i} #{line.join(' ')}"
        end
    end

    def solved?
        if self.row_solved? &&
            self.col_solved? &&
            self.square_solved?
            return true
        end
        return false
    end

    def row_solved?
        @grid.all? do |row|
            return false if row.any? {|ele| ele.value.nil?}
            test_row = row.map {|ele| ele = ele.value}
            test_row.sort == (1..9).to_a
        end
    end

    def col_solved?
        (0..8).each do |i|
            test_col = []
            @grid.each do |row|
                test_col << row[i]
            end
            final_test = test_col.map { |ele| ele.value}
            return false if (1..9).to_a != final_test.sort
        end
        return true
    end

    def square_solved?
        i = 0
        j = 2
        arr = (1..9).to_a
        while j <= 9
            final_test1 = []
            final_test2 = []
            final_test3 = []
            (i..j).each do |idx1|
                (0..2).each do |idx2|
                    final_test1 << @grid[idx1][idx2].value
                end
                (3..5).each do |idx2|
                    final_test2 << @grid[idx1][idx2].value
                end
                (6..8).each do |idx2|
                    final_test3 << @grid[idx1][idx2].value
                end
            end
            return false if final_test1.sort != arr || final_test2.sort != arr || final_test3.sort != arr
            i += 3
            j += 3
        end
        return true
    end
end