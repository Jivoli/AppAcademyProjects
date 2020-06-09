class Item

        attr_writer :title, :description
        attr_reader :title, :description, :deadline, :state
        
    require "byebug"
    def self.valid_date?(date_string)
        numbers = "0123456789"
        return false if date_string.each_char.count('-') != 2
        selfsplit = date_string.split('-')
        return false if selfsplit[0].length != 4
        return false if selfsplit[1].length != 2 || selfsplit[2].length != 2
        return false if selfsplit.length != 3
        return false if selfsplit[1].to_i > 12
        return false if selfsplit[2].to_i > 31
        return false if selfsplit.join('').each_char.any?{ |char| !numbers.include?(char)}
        true
    end

    def initialize(title, deadline, description)
        raise 'invalid date' if !Item.valid_date?(deadline)
        @title = title
        @deadline = deadline
        @description = description
        @state = false
    end

    def deadline=(new_deadline)
        raise 'invalid date' if !Item.valid_date?(new_deadline)
        @deadline = new_deadline 
    end

    def toggle
        @state = !@state
    end



    
end


