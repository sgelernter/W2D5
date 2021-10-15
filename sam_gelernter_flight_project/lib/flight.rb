require "byebug"

class Flight 

    def initialize(fn, capacity)
        @flight_number = fn 
        @capacity = capacity
        @passengers = []
    end

    attr_reader :passengers

    def full?
        self.passengers.length == @capacity
    end

    def board_passenger(passenger)
        if !self.full?
            @passengers << passenger if passenger.has_flight?(@flight_number)
        end
    end

    def list_passengers
        passengers.map { |passenger| passenger.name }
    end

    def [](idx)
        passengers[idx]
    end

    def <<(passenger)
        self.board_passenger(passenger)
    end
end