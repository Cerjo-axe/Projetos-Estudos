require_relative 'engine.rb'

def player
    game=Engine.new
    game.start_game
    replay
    
end
def replay
    puts "Do you wish to replay the game? (yes=y, no=n)"
    inp = gets.chomp.downcase
    if inp=='y'
        player
    else
        puts "CLosing"
    end
end

player