class Item
    attr_accessor :title, :deadline, :description

    def self.valid_date?(date_string)
        date = date_string.split("-")
        year = date[0].to_i
        month = date[1].to_i
        day = date[2].to_i
        return true if month.between?(1,12) && day.between?(1,31)
        false
    end

    def initialize(title, deadline, description)
        @title = title
        if !Item.valid_date?(deadline)
            raise "enter a new deadeline with the following format YYY-MM-DD" 
        else
            @deadline = deadline
        end
        @description = description
    end

    def deadline=(new_deadline)
        if !Item.valid_date?(new_deadline)
            raise "enter a new deadeline with the following format YYY-MM-DD" 
        else
            @deadline = new_deadline
        end
    end

end



