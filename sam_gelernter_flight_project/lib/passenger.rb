require "byebug"

class Passenger
    
    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    attr_reader :name

    def has_flight?(fn_str)
        @flight_numbers.include?(fn_str.upcase)
    end

    def add_flight(fn_str)
        self.has_flight?(fn_str) ? return : @flight_numbers << (fn_str.upcase)
    end

end