class Passenger

    attr_reader :name
    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def has_flight?(str)
        if @flight_numbers.include?(str.upcase)
            return true
        else
            return false
        end
    end

    def add_flight(str)
        if !has_flight?(str)
            @flight_numbers << str.upcase
        end
    end
end