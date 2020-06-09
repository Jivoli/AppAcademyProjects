;require './list.rb'
require './item.rb'

class TodoBoard

    def initialize
    @list = {}
    end

    def get_command
        print "\nEnter a command: "
        cmd, target, *args = gets.chomp.split(' ')

        case cmd
        when 'mktodo'
            @list[target].add_item(*args)
        when 'up'
            @list[target].up(*args.map! {|arg| arg.to_i})
        when 'down'
            @list[target].down(*args.map! {|arg| arg.to_i})
        when 'swap'
            @list[target].swap(*args.map! {|arg| arg.to_i})
        when 'sort'
            @list[target].sort_by_date!
        when 'priority'
            @list[target].priority
        when 'print'
            if args.length == 0
                @list[target].print
            else
                @list[target].print_full_item(*args.map! {|arg| arg.to_i})
            end
        when 'toggle'
            @list[target].toggle_item(*args.map! {|arg| arg.to_i})
        when 'rm'
            @list[target].remove_item(*args.map! {|arg| arg.to_i})
        when 'purge'
            @list[target].purge
        when 'mklist'
            @list[target] = List.new(target)
        when 'ls'
            @list.each do |k, v|
                p ' ' + k
            end
        when 'showall'
            @list.each do |k, v|
                @list[k].print
            end
        when 'quit'
            return false
        else
            print "Sorry, that command is not recognized."
        end

        true
    end

    def run 
        while self.get_command
            self.get_command
        end
    end
end