require_relative "board.rb"
require_relative "display.rb"
require_relative "inputhandler"

class Game
    attr_accessor :player
    attr_reader :board
    def initialize
        @player = 0
    end
    def new_game
        @board=Board.new     
        Display.displayboard(board.board)  
        game_loop 
    end

    def game_loop
        until has_ended? 
            change_player
            invalid_column = true
            while invalid_column
                input = InputHandler.inputconverter(InputHandler.getinput(/^[0-7]$/).to_i)
                invalid_column=false unless board.columnfilled?(input)
            end
            board.placepiece(player,input)
            
            Display.displayboard(board.board) 
        end
    end

    def change_player
        if @player==1
            @player=2
        else
            @player=1
        end
    end
    def has_ended?
        return true if board.haswon? || board.isfull?
        false
    end

end

