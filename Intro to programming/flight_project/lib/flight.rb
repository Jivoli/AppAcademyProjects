class Flight

    attr_reader :passengers

    def initialize(str, num)
        @flight_number = str.upcase
        @capacity = num
        @passengers = []
    end

    def full?
        if @passengers.length == @capacity
            return true
        end
        return false
    end

    def board_passenger(passenger)
        if !full?
            if passenger.has_flight?(@flight_number)
                @passengers << passenger
            end
        end
    end

    def list_passengers
       final_arr = []
       @passengers.each do |card|
        final_arr << card.name
       end
       final_arr
    end

    def [](num)
        return @passengers[num]

    end

    def <<(passenger)
        board_passenger(passenger)
    end

end