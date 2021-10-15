require_relative "./item.rb"
require_relative "./list.rb"
require "byebug"

class ToDo

    def initialize(label)
        @list = List.new(label)
    end

    def get_command
        print "\nEnter a valid command:\n"
        cmd, *args = gets.chomp.split(" ")
        case cmd
        when "mktodo"
            @list.add_item(*args)
        when "up"
            args.map! {|ele| ele.to_i }
            @list.up(*args)
        when "down"
            args.map! {|ele| ele.to_i }
            @list.down(*args)
        when "swap"
            args.map! {|ele| ele.to_i }
            @list.swap(*args)
        when "sort"
            @list.sort_by_date!
        when "priority"
            @list.print_full_item(0)
        when "print"
            args.empty? ? @list.print : @list.print_full_item(args[0].to_i)
        when "quit"
            return false
        end
        true
    end

    def run
        while self.get_command 
        end
    end
end