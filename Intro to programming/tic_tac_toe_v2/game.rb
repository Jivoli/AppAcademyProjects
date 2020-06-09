require './board.rb'
require './human_player.rb'



class Game
    def initialize(num, *marks)
        @players= []
        marks.each do |mark|
            @players << HumanPlayer.new(mark)
        end

        
        @board = Board.new(num)
        @current_player = @players[0]
    end

    def switch_turn
        @players.rotate!
        @current_player = @players[0]
    end

    def play 
        while @board.empty_positions?
            @board.print
            new_pos = @current_player.get_position
            @board.place_mark(new_pos, @current_player.mark)

            if @board.win?(@current_player.mark)
                puts "Victory !!" 
                puts @current_player.mark.to_s + ' has won'
                return
            else
                switch_turn
            end
        end
        p "Draw"

    end
end