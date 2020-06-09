require './board.rb'
require './human_player.rb'
require './computer_player.rb'



class Game
    def initialize(num, hash)
        @players= []
        hash.each do |k, v|
            if hash[k]
                @players << ComputerPlayer.new(k)
            else
                @players << HumanPlayer.new(k)
            end
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
            new_pos = @current_player.get_position(@board.legal_positions)
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