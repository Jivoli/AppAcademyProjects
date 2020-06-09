require "./game.rb"
require "./player.rb"
require "byebug"
class AiPlayer
    attr_reader :name, :type
    def initialize(name)
        @name = name
        @type = 'computer'
        leslignes = File.readlines('dictionary.txt')
        arr = []
        leslignes.each do |line|
            arr << line.chomp
        end
        @dictionary = arr.to_set
    end

    def play(fragment, players)
        selection = @dictionary.select{ |ele| ele[0...fragment.length] == fragment}
        winning_moves = []
        selection.each do |ele|
            winning_moves << ele if ele.length < (fragment.length + players) && ele.length != fragment.length + 1
        end
        if winning_moves.length > 0
            return winning_moves[0][fragment.length]
        else return selection.sample[fragment.length]
        end
    end
end