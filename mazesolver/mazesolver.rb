require "byebug"

class Maze
    attr_accessor :maze, :current_position, :moves
    def initialize
        p "Please chose the name of the Maze you wanna solve"
        name = gets.chomp + '.txt'
        @maze = []
        File.readlines(name).each do |line|
            @maze << line.chomp
        end
        @current_position = []
        @winning_position = []
        @maze.each.with_index do |line, i|
            line.each_char.with_index do |char, j|
                if char == "S"
                    @current_position << i
                    @current_position << j
                elsif char == "E"
                    @winning_position << i 
                    @winning_position << j
                end
            end
        end
        @moves = []
        @closed_list = []

    end

    def print_maze
        @maze.each do |line|
            p line
        end
    end

    def up
        row = @current_position[0]
        col = @current_position[1]
        if @maze[row - 1][col].nil? || @maze[row - 1][col] == "*" || @maze[row - 1][col] == "S"
            return false
        end
        return true

    end

    def down
        row = @current_position[0]
        col = @current_position[1]
        if @maze[row + 1][col].nil? || @maze[row + 1][col] == "*" || @maze[row + 1][col] == "S"
            return false
        end
        return true

    end

    def left
        row = @current_position[0]
        col = @current_position[1]
        if @maze[row][col - 1].nil? || @maze[row][col - 1] == "*" || @maze[row][col - 1] == "S" 
            return false
        end
        return true

    end

    def right
        row = @current_position[0]
        col = @current_position[1]
        if @maze[row][col + 1].nil? || @maze[row][col + 1] == "*" || @maze[row][col + 1] == "S"
            return false
        end
        return true

    end

    def maze_put_cross
        row = @current_position[0]
        col = @current_position[1]
        @maze[row][col] = "X"
    end

    def play_round
        p "chose a move between 'up', 'down', 'left' or 'right"
        decision = gets.chomp
        row = @current_position[0]
        col = @current_position[1]

        case decision
        when 'up'
            if self.up
                @current_position[0] = (row - 1)
                @current_position[1] = col
                @moves << decision
            end
           self.maze_put_cross
        when 'down'
           if self.down
                @current_position[0] = (row + 1)
                @current_position[1] = col
                @moves << decision
           end
           self.maze_put_cross
        when 'right'
           if self.right
                @current_position[0] = row
                @current_position[1] = (col + 1)
                @moves << decision
           end
           self.maze_put_cross
        when 'left'
            if self.left
                @current_position[0] = row
                @current_position[1] = (col - 1)
                @moves << decision
            end
           self.maze_put_cross
        end
    end

    def win?
        return true if @current_position == @winning_position
        return false
    end

    def run 
        while !win?
            self.play_round
            self.print_maze
        end
        p "Ah bah voilà, enfin arrivé bâtard"
        p @moves

    end

    def run_computer
        maze_initial = @maze.dup.frozen
        position = @current_position.dup.frozen
        counter = 1
        while !win?
            
           decision = ['up', 'down', 'left', 'right'].repeated_combination(counter).to_a
           decision.each do |possibility|
            @maze = maze_initial
            @current_position = position
            @moves = []
            debugger
            self.play_round_computer(possibility)
           end
           counter += 1
        end
        self.print_maze
        p "Ah bah voilà mon srab, t'as trouvé !"
        p @moves
    end

    def Computer_counter
        counter = 0
        @maze.each do |line|
            line.each_char do |char|
                counter += 1 if char == " "
            end
        end
    end

    def possibilities
        final_arr = []
        ['up', 'down', 'left', 'right'].each do |poss|
            case poss
            when 'up'
                final_arr << poss if self.up
            when 'down'
                final_arr << poss if self.down
            when 'left'
                final_arr << poss if self.left
            when 'right'
                final_arr << poss if self.right
            end
        end
        final_arr

    end

    def counter(str)
        row = @current_position[0]
        col = @current_position[1]
        case str
        when 'up'
            @winning_position[0] - row + @winning_position[1] - col - 1
        when'down'
            @winning_position[0] - row + @winning_position[1] - col + 1
        when 'left'
            @winning_position[0] - row + @winning_position[1] - col - 1
        when 'right'
             @winning_position[0] - row + @winning_position[1] - col + 1
        end

    end

    def best_possibility(arr)
        final_act = arr[0]
        arr.each do |action|
            case action
                when 'up'
                if self.counter(action) <= self.counter(final_act) && !@closed_list.include?([@current_position[0] - 1, @current_position[1]])
                    final_act = action
                end
            when 'down'
                if self.counter(action) <= self.counter(final_act) && !@closed_list.include?([@current_position[0] + 1, @current_position[1]])
                    final_act = action
                end
            when 'left'
                if self.counter(action) <= self.counter(final_act) && !@closed_list.include?([@current_position[0], @current_position[1] - 1])
                    final_act = action
                end
            when 'right'
                if self.counter(action) <= self.counter(final_act) && !@closed_list.include?([@current_position[0], @current_position[1] + 1])
                    final_act = action
                end
            end
        end
        final_act
    end

    def make_move(movement)
        row = @current_position[0]
        col = @current_position[1]

        case movement
        when 'up'
            if self.up
                @current_position[0] = (row - 1)
                @current_position[1] = col
                @moves << movement
                @closed_list << @current_position
            end
           self.maze_put_cross
        when 'down'
           if self.down
                @current_position[0] = (row + 1)
                @current_position[1] = col
                @moves << movement
                @closed_list << @current_position
           end
           self.maze_put_cross
        when 'right'
           if self.right
                @current_position[0] = row
                @current_position[1] = (col + 1)
                @moves << movement
                @closed_list << @current_position
           end
           self.maze_put_cross
        when 'left'
            if self.left
                @current_position[0] = row
                @current_position[1] = (col - 1)
                @moves << movement
                @closed_list << @current_position
            end
           self.maze_put_cross
        end
    end

    def explore
        while !self.win?
            debugger
        poss = self.possibilities
        choice = self.best_possibility(poss)
        self.make_move(choice)
        end
        self.print_maze
        p self.closed_list

    end



    


end

