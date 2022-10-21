require_relative 'gamerules.rb'
require_relative 'display_code.rb'

class GuessMode

    attr_reader :guess_code
    include GameRules
    include Display
    def initialize
        rand_numbers=[rand(1..6),rand(1..6),rand(1..6),rand(1..6)]
        @generated_code = rand_numbers.map{|number| number.to_s}
        puts "GUESS MODE SELECTED"
    end

    def game_loop
        turn =1
        while turn <=12 do
            puts "TRY n° #{turn}"
            puts "Insert a guess:"
            @guess_code=check_input.split(//)
            turn+=1

            if guess_code[0]=='q'
                break

            end
            compare(@generated_code,@guess_code)
            print_code(@guess_code)
            print_pins(exact_qnty,dif_pos)

            if won?(@generated_code,@guess_code)
                puts "YOU WON!!!"
                break
            end 
        end
        puts "YOU LOST"
    end

    def check_input
        input = gets.chomp
        if /^[1-6]{4}$/.match(input)
            return input
        elsif input.downcase=='q'
            return 'q'
        else
            puts "Insert a valid option!!!"
            check_input
        end
    end
end

