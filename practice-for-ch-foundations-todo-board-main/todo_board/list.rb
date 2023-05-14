require './item.rb'

class List
    attr_accessor :label
    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, *description)
        description ||= ''
        if Item.valid_date?(deadline)
            @items << Item.new(title, deadline, description)
            true
        else
            false
        end
    end

    def size
        @items.size
    end

    def valid_index?(index)
        @items.each_with_index { |ele, idx| return true if idx == index.to_i }
        false
    end

    def swap(index_1, index_2)
        index_1 = index_1.to_i
        index_2 = index_2.to_i
        if valid_index?(index_1) && valid_index?(index_2)
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            true
        else
            false
        end
    end

    def [](index)
        index = index.to_i
        if valid_index?(index)
            @items[index]
        else
            nil
        end
    end

    def priority
        @items[0]
    end

    def print
        puts "--------------------------"
        puts "        GROCERIES         " 
        puts "--------------------------"
        puts "Index | Item | Deadline   "
        puts "--------------------------"
        @items.each_with_index do |ele, idx|
            puts "#{idx.to_s} | #{ele.title } | #{ele.deadline}" 
        end
        puts "--------------------------"
    end

    def print_full_item(index)
        puts "--------------------------"
        @items.each_with_index do |ele, idx|
            if idx == index.to_i
                puts "#{ele.title } | #{ele.deadline}" 
                puts "#{ele.description}"
            end
        end
        puts "--------------------------"
    end

    def print_priority
        print_full_item(0)
    end

    def up(index, amount = 1)
        index = index.to_i
        amount = amount.to_i
        if valid_index?(index)
            return true if index == 0
            count = 0
            while amount > count
                swap(index,index-1)
                index -= 1
                count += 1
            end
            true
        else
            false
        end
    end

    def down(index, amount = 1)
        index = index.to_i
        amount = amount.to_i
        if valid_index?(index)
            return true if index == @items.size
            count = 0
            while amount > count
                swap(index,index+1)
                index += 1
                count += 1
            end
            true
        else
            false
        end
    end

    def sort_by_date!
        @items.sort_by! { |ele| ele.deadline }
    end


end