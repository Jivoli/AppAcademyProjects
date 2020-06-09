require './board.rb'
require './human_player.rb'

class Game
    def initialize(player_1_mark, player_2_mark)
        @player_1 = HumanPlayer.new(player_1_mark)
        @player_2 = HumanPlayer.new(player_2_mark)
        @board = Board.new
        @current_player = @player_1
    end

    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        else
           @current_player = @player_1
        end
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