require_relative 'game.rb'
require_relative 'messages.rb'

class Main
    def initialize
        @game = Game.new
        play
    end

    def play
        replay=true
        while replay do
            @game.play 
            replay=replay_game
        end 
    end

    def replay_game
        puts("Press 1 to replay the game")
        input = @game.get_input(/^[1-2]$/)
        return input=='1'
    end

end

Main.new