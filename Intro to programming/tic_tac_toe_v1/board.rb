class Board
    attr_reader :grid
    def initialize
        @grid = Array.new(3) {Array.new(3, '_')}
    end

    def valid?(position)
        row, col = position
        position.all? do |i|
            i >= 0 && i < @grid.length
        end
    end

    def empty?(position)
        row, col = position
        return true if @grid[row][col] == "_"
        return false
    end

    def place_mark(position, mark)
        row, col = position
        if valid?(position) && empty?(position)
            @grid[row][col] = mark
        elsif !valid?(position) || !empty?(position)
            raise 'invalid mark'
        end
    end

    def print
        @grid.each do |row|
            puts row.join(' ')
        end
    end

    def win_row?(mark)
        @grid.each do |row|
            return true if row.all? {|ele| ele == mark}
        end
        return false
    end

    def win_col?(mark)
        (0...grid.length).each do |i|
           return true if @grid.all? {|row| row[i] == mark}
        end
        return false
    end
    def win_diagonal?(mark)
        final_arr = []
        
        (0...@grid.length).each do |i|
            final_arr << @grid[i][i]
        end
        return true if final_arr.all? {|ele| ele == mark}
        final_arr = []

        (0...grid.length).each do |i|
            final_arr << @grid[i][- i - 1]
            
        end
        return true if final_arr.all? {|ele| ele == mark}

        return false

    end
   

    def win?(mark)
        if win_diagonal?(mark)
            return true
        elsif win_col?(mark)
            return true
        elsif win_row?(mark)
            return true
        else
            return false
        end
    end 

    def empty_positions?
        (0...grid.length).each do |i|
            (0...grid.length).each do |j|
                return true if empty?([i, j])
            end
        end
        return false
    end
    
end

