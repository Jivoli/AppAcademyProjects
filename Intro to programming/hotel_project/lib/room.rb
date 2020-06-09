class Room

def initialize(cap)
    @capacity = cap
    @occupants = []
end

def capacity
   @capacity 
end

def occupants
    @occupants
end

def full?
    return false if @occupants.length < @capacity
    return true if @occupants.length == capacity
end

def available_space
    return capacity - @occupants.length
end

def add_occupant(str)
    if !full?
        occupants << str
        return true
    else
        false
end
end

 



end
