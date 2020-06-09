require './item.rb'

class List

    attr_accessor :label
    attr_reader :items

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description = "")
        if Item.valid_date?(deadline)
            @items << Item.new(title, deadline, description)
            return true
        else
            return false
        end
    end

    def size
        @items.length
    end

    def valid_index?(index)
        return false if index < 0
        return false if index >= @items.length
        return true
    end

    def swap(index_1, index_2)
        return false if !valid_index?(index_1) || !valid_index?(index_2)
        @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
        return true
    end

    def [](index)
        return nil if !valid_index?(index)
        return @items[index]
    end

    def print_priority
        print_full_item(0)
    end

    def print
        p "------------------------------------------"
        p "                GROCERIES                 "
        p "------------------------------------------"
        p "Index | Item                 | Deadline   "
        p "------------------------------------------"
        @items.each.with_index do |item, i|
        p "#{i}" + "     | " + "#{item.title}" + "              | " + "#{item.deadline}"
        end
        p "------------------------------------------"
    end

        def print_full_item(index)
            return false if !valid_index?(index)
            p "------------------------------------------"
            p "#{@items[index].title}" + "                           " + "#{@items[index].deadline}"
            p "#{@items[index].description}" 
            p "------------------------------------------"
            return nil
        end

        def print_priority
            print_full_item(@items[0])
        end

        def down(index, amount = 1)
            return false if !valid_index?(index)
            amount.times do
                if @items[index] == @items[-1]
                    swap(index, 0)
                    index +=1                   
                else
                    swap(index, index + 1)
                    index += 1
                end
            end
            return true
        end

        def up(index, amount = 1)
            return false if !valid_index?(index)
            amount.times do
                if index == 0
                    swap(index, -1)
                    index -= 1                  
                else
                    swap(index, index - 1)
                    index -= 1
                end
            end
            return true
        end

        def sort_by_date!
            @items.sort_by! { |item| item.deadline}
        end

    
end