

class Player
    attr_reader :name, :type
    def initialize(name)
        @name = name
        @type = "human"
    end
end