require "passenger"

class Flight
    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def passengers
        @passengers
    end

    def full?
        !(@passengers.size < @capacity)
    end

    def board_passenger(pass)
        if !full?        
            if pass.has_flight?(@flight_number)
                @passengers << pass
            end
        end
    end

    def list_passengers
        @passengers.map { |ele| ele.name }

    end

    def [](index)
        @passengers[index]
    end

    def <<(pass)
        board_passenger(pass)
    end
end