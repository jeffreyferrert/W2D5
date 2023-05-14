require "./list.rb"

class TodoBoard

    def initialize(label)
        @list = List.new(label)
    end

    def get_command
        print "\nEnter a command: "
        cmd, *args = gets.chomp.split(' ')

        case cmd
        when 'mktodo'
          @list.add_item(*args)
        when 'up'
            @list.up(*args)
        when 'down'
            @list.down(*args)
        when 'swap'
            @list.swap(*args)
        when 'sort'
            @list.sort_by_date!
        when 'priority'
            @list.print_priority
        when 'print'
            if args.length == 1
                @list.print_full_item(*args)
            else
                @list.print
            end
        when 'quit'
          return false
        else
          print "Sorry, that command is not recognized."
        end    
        true
    end

    def run
        while get_command 
            self.get_command
        end
        
    end

    
end