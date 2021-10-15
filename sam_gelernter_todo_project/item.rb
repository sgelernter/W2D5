require "byebug"

class Item

    def self.valid_date?(date_string)
        months = (1..12).to_a
        days = (1..31).to_a
        elements = date_string.split("-")
        return false if elements.length != 3
        return false if elements.any? {|ele| ele.to_i.to_s != ele }
        return false if elements[0].length != 4
        return false if !months.include?(elements[1].to_i) || !days.include?(elements[2].to_i)
        true
    end

    def initialize(title, deadline, description)
        @title = title
        @deadline = deadline
        @description = description
        raise "Sorry, that is not a valid date" if !Item.valid_date?(@deadline)
    end

    attr_accessor :title, :deadline, :description
end


