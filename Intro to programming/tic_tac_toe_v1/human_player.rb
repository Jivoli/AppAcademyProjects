

class HumanPlayer

    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end


    def get_position
        print "Please enter the positions, with a space in-between"
        position = gets.chomp.split(' ').map(&:to_i)
        raise "tu t'es viandé boloss" if position.length != 2
        position
    end


end