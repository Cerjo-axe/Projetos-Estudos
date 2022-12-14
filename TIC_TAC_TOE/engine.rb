require_relative 'board.rb'
require_relative 'player.rb'
require_relative 'messages.rb'

class Engine 
    include Messages
    attr_reader :first_player, :current_player,:second_player
    def initialize
        @board=Board.new
        @first_player=nil
        @second_player=nil
        @current_player=nil
    end

    def start_game
        set_up_game
        @board.showBoard()
        game_loop
    end

    def create_player(number)
        puts "(Insert name):"
        name = gets.chomp
        if number==1
            symbol = "X"
        else
            symbol = "O"
        end
        return Player.new(name,symbol)
    end

    private
    def set_up_game
        @first_player=create_player(1)
        @second_player=create_player(2)
        @current_player=first_player
    end

    def game_loop
        while @board.iscomplete? do
            puts player_mes(current_player.name)
            player_turn(current_player)
            @board.showBoard()
            if @board.iswinner?
                puts winner_mes(current_player.name)
                break
            end
            change_player
        end
    end

    def player_turn(player)
        input = gets.chomp.to_i

        if @board.is_valid?(input)
            @board.updateBoard(input-1,player.symbol)
        else
            puts pos_error
            player_turn(player)
        end
    end

    def change_player()
        if current_player.name==first_player.name
            @current_player=second_player
        else
            @current_player=first_player
        end
    end
end
