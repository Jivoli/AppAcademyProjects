
class ComputerPlayer

    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end


    def get_position(legal_positions)
        
        choice = legal_positions[rand(0...legal_positions.length)]
        print "Computer #{self.mark} chose position #{choice.to_s}"
        choice
    end



end