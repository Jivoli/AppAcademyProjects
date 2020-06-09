require './board.rb'
require './card.rb'

class Memory

    def initialize(size = 4)
        @board = Board.new(size)
        @last_pos = nil
    end

    def play

        while !@board.won?
            system("clear")
            @board.render
            p "please chose a place you wanna try, writing it 'x,y'"
            pos = gets.chomp.split(',')
            if valid_pos?(pos)
                make_guess(pos)
            end
            sleep(3)
        end
        p "congrats! you won !"


    end

    def valid_pos?(pos)
        pos.all? { |ele| ele < 0 || ele >= @board.grid.length}
    end

    end

    def make_guess(pos)
        if @last_pos == []

        end
    end


end