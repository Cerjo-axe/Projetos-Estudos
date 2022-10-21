require_relative 'guessmode.rb'
require_relative 'mastermode.rb'
class Game

    def play
        puts "Select game mode (1-guess 2-master)"
        mode = mode_select
        if mode == '1'
            @guessgame = GuessMode.new
            @guessgame.game_loop
        else
            @mastergame = MasterMode.new
            @mastergame.computer_loop
        end

    end

    def mode_select
        input = gets.chomp
        if input.match(/^[1-2]$/)
            return input
        end
        mode_select
    end
end

game=Game.new
game.play
