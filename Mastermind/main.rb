require_relative 'game.rb'

def main
    game = Game.new
    running = true

    while running do
        game.play
        running = reset
    end
end
def reset
    puts "Do you wish to replay y or n"
    input = gets.chomp
    if input == "y"
        true
    elsif input =="n"
        false
    else
        puts "insert a valid option"
        reset
    end
end

main