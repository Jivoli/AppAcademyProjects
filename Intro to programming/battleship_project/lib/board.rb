class Board
    require "byebug"

    attr_reader :size

    def initialize(num)
       @grid = Array.new(num) {Array.new(num, :N)}
       @size = num * num
    end

    def [](arr)
        @grid[arr[0]][arr[1]]
    end
        
    def []=(pos, val)
        @grid[pos[0]][pos[1]] = val
    end

    def num_ships
        @grid.flatten.count(:S)
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            p "you sunk my battleship!"
            return true
            else 
           self[pos] = :X
            return false
        end
    end
    
    def place_random_ships
        i = 0
        while i < @grid.flatten.length / 4
           random_pos_id1 = rand(0...@grid.length)
           random_pos_id2 = rand(0...@grid.length) 
           if @grid[random_pos_id1][random_pos_id2] != :S
            @grid[random_pos_id1][random_pos_id2] = :S 
            i += 1
           end
        end

    end

    def hidden_ships_grid
        hidden_grid = Array.new(@grid.length) {Array.new(@grid.length, 0)}
        @grid.each.with_index do |row, idx1|
            row.each.with_index do |ele, idx2|
                if ele == :S
                    hidden_grid[idx1][idx2] = :N
                else
                    hidden_grid[idx1][idx2] = @grid[idx1][idx2]
                end
            end
        end
        hidden_grid
    end

    def self.print_grid(arr)
        
        arr.each do |row|
            puts row.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end



end
