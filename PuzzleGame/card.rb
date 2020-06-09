class Card
   
    
    def initialize(value, face_up = false)
        @value = value
        @face_up = face_up
    end

    def to_s
        self.reveal? ? @value.to_s : " "
    end

    def reveal?
        return true if @face_up
    return false
    end

    def reveal
        @face_up = true
    end

    def hide
        @face_up = false
    end
end