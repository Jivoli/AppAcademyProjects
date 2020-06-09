class Tile
    require 'colorize'
    attr_reader :value
    def initialize(value = nil, given = false)
        @value = value
        @given = given
    end

    def to_s
        if @value
            if @given
               stringed = @value.to_s
               stringed.blue
            else
            @value.to_s.red
            end
        else
            " "
        end
    end

    def valid_value?
        return true if !@given
        return false
    end

    def change_value(new_val)
        if !self.valid_value?
            raise "Impossible de changer un caractère pré-existant"
        else
            @value = new_val
        end
    end

end