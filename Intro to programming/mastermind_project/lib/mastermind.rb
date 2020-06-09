require_relative "code"

class Mastermind

    def initialize(num)
        @secret_code = Code.random(num)
    end

    def print_matches(arr)
        p @secret_code.num_exact_matches(arr)
        p @secret_code.num_near_matches(arr)
    end

    def ask_user_for_guess
        p "Enter a code"
        response = gets.chomp
        
        final = Code.from_string(response)
        self.print_matches(final)
        @secret_code == final
    end

end
