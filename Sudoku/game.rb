require './board.rb'
require './tile.rb'

class Game

    def initialize
        @board = Board.new
    end

    def play
        while !@board.solved?
            @board.render
            p "Chose a new location where you wanna put a value, in the type 'x y'"
            new_pos = gets.chomp.split(' ').to_a
            new_pos.map! {|ele| Integer(ele)}
            if valid_pos?(new_pos)
                p "Chose now the new value of this case"
                new_val = Integer(gets.chomp)
                if valid_value?(new_val)
                    @board[new_pos] = new_val
                end
            end
        end
        p "congrats ! that's a win !!"
    end

    def valid_pos?(new_pos)
        new_pos.each do |num|
            return false if num < 0 || num > 8
        end
        return false if !@board[new_pos].valid_value?
        return true
    end

    def valid_value?(new_val)
        return false if new_val < 1 || new_val > 9
        return true
    end
end