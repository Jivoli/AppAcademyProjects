class Player

    def get_move
        p "enter a position with coordinates separated with a space like #{"4 7 "}"
        empty_arr = []
        getter = gets.chomp.split(' ')
        getter.each {|char| empty_arr << char.to_i}
        empty_arr
    end
        

end
