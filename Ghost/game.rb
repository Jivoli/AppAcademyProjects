
require './player.rb'
require './AiPlayer.rb'
require 'byebug'
class Game

    attr_reader :players, :dictionary, :fragment

    def initialize(*players)
        @players = []
        players.each do |player|
            @players << Player.new(player)
        end
        @fragment = ""
        leslignes = File.readlines('dictionary.txt')
        arr = []
        leslignes.each do |line|
            arr << line.chomp
        end
        @dictionary = arr.to_set
        @counter = Hash.new(0)
        p "Do you want an AI playing against you ?" + "/n type Y or N"
        answ = gets.chomp
        if answ == "Y"
            @players << AiPlayer.new("Alvin 3000")
        end
    end

    def current_player
        @players[0]
    end

    def previous_player
        @players[-1]
    end

    def next_player!
      @players.rotate!
    end

    def take_turn(player)
        if player.type == "human"
            p 'wesh ' + "#{player.name}" + ' à toi djouer'
            char = gets.chomp
            while !valid_play?(char)
                p 'sorry, this is not valid, please enter just a char.'
                char = gets.chomp
            end
            @fragment += char
        else
        @fragment += player.play(@fragment, @players.length)
        end
    end

    def valid_play?(string)
        alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
        return false if !alphabet.include?(string)
        return false if string.length != 1
        tester = @fragment.dup
        tester += string
        selection = @dictionary.select{ |i| i[0...tester.length] == tester}
        return true if selection.length > 0
    end

    def have_i_lost
        selection = @dictionary.select{ |i| i[0...@fragment.length] == @fragment}
        return true if selection.length == 1 && selection[0].length == @fragment.length
        return false
    end

    def score(player)
        if @counter[player] == 0
            p "#{player}" + ' _ _ _ _ _'
        elsif @counter[player] == 1
            p "#{player}" + ' G _ _ _ _'
        elsif @counter[player] == 2
            p "#{player}" + ' G H _ _ _'
        elsif @counter[player] == 3
            p "#{player}" + ' G H O _ _'
        elsif @counter[player] == 4
            p "#{player}" + ' G H O S _'
        elsif @counter[player] == 5
            p "#{player}" + ' G H O S T'
        end
    end

    def play_round
        @players.each do |player|
            score(player.name)
        end
        while !self.have_i_lost
            player = self.current_player
            p "c'est le tour de " + "#{player.name}"
            p @fragment
            take_turn(player)
            self.next_player!
        end
        p "PERDU ! " + "#{self.previous_player.name}" +" est une grosse trompette"
        @counter[self.previous_player.name] += 1
        @fragment = ""
    end

    def run
        while !@players.any? {|player| @counter[player.name] == 5}
            self.play_round
        end
        p  "Fin de Partie !"  + "#{self.current_player.name}" + "est le mailon faible"
    end
end

def sayHello(lulu)
    p "Hello miss, how are you doing ?"
    answer = gets.chomp
    if answer == "Ca va au top"
        return "En voilà une bonne nouvelle"
    else
        return "Oh boh alors qu'est-ce qui vous chagrine ?"
    end
    return true

end

puts sayHello('lulu')
