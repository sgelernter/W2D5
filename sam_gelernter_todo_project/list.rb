require "byebug"
require_relative "./item.rb"

class List
    
    def initialize(label)
        @label = label
        @items = []
    end

    attr_accessor :label

    def add_item(title, deadline, description = "")
        return false if !Item.valid_date?(deadline)
        item = Item.new(title, deadline, description)
        @items << item
        true
    end

    def size
        @items.length
    end

    def valid_index?(idx)
        return false if idx < 0 || !@items[idx]
        true
    end

    def swap(idx1, idx2)
        return false if !self.valid_index?(idx1) || !self.valid_index?(idx2)
        @items[idx1], @items[idx2] = @items[idx2], @items[idx1]
        true
    end

    def [](idx)
       @items[idx] 
    end

    def priority
        @items.first
    end

    def print_completion(idx)
        @items[idx].completed ? "\u2713" : "X"
    end

    def print
        puts "-----------------#{self.label.upcase}------------------"
        @items.each.with_index do |item, i|
            puts "#{i.to_s.ljust(4)}#{self.print_completion(i)}  #{item.title.ljust(20)}| #{item.deadline}"
        end
        puts "---------------------------------------"
    end

    def print_full_item(idx)
        puts "---------------------------------------"
        puts "#{self.print_completion(idx)} - #{self[idx].title.ljust(30)}#{self[idx].deadline}"
        puts "#{self[idx].description}"
        puts "---------------------------------------"
    end

    def print_priority
        self.print_full_item(0)
    end

    def up(idx, amt = 1)
        swappee = self[idx]
        return false if !self.valid_index?(idx)
        while amt > 0
            self.swap(idx, idx-1) if self.priority != swappee
            amt -= 1
            idx -=1
        end
        true
    end

    def down(idx, amt = 1)
        swappee = self[idx]
        return false if !self.valid_index?(idx)
        while amt > 0
            self.swap(idx, idx+1) if @items.last != swappee
            amt -= 1
            idx += 1
        end
        true
    end

    def sort_by_date!
        @items.sort_by! { |item| item.deadline }
    end

    def toggle_item(idx)
        @items[idx].toggle
    end

    def remove_item(idx)
        return false if idx > @items.length - 1
        @items.delete_at(idx)
        true
    end

    def purge
        @items.delete_if { |item| item.completed }
    end

end

testList = List.new("test")
testList.add_item("laundry", "1617-7-2", "dang, that's some old-ass laundry bruh")
testList.add_item("groceries", "2021-10-16", "get them groceries")
testList.add_item("dishes", "2021-11-18", "scrub a dub dub, baby")
testList.add_item("work out", "2022-6-2", "it's gotta happen eventually, baby")

testList.print
testList.toggle_item(0)
testList.toggle_item(2)
testList.print
testList.purge
testList.print_priority
# testList.toggle_item(2)
# testList.print
# testList.down(0,2)
# testList.print
# testList.down(1,1)
# testList.print
# testList.down(2,4)
# testList.print