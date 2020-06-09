require_relative "room"

class Hotel

    def initialize(str, hash)
        @name = str
        @rooms = {}
        hash.each do |k, v|
            @rooms[k] = Room.new(v)
        end
    end

    def name
        new_name = []
        @name.split(" ").each do |word|
            new_name << word.capitalize
        end
        return new_name.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(str)
        if @rooms.has_key?(str)
            return true
        else
            return false
        end
    end

    def check_in(person, room_name)
        if !self.room_exists?(room_name)
            puts "sorry, room does not exist"
            return
        end

        success = @rooms[room_name].add_occupant(person)
        if success
            puts "check in successful"
        else
            puts "sorry, room is full"
        end

    end

    def has_vacancy?
      @rooms.values.any? {|room| !room.full?} 
        
    end
  
    def list_rooms
        @rooms.each do |arg, room|
            puts "#{arg} : #{room.available_space}"
        end
    end
end
