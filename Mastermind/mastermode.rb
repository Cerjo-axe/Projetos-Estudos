require_relative 'gamerules.rb'
require_relative 'display_code.rb'



class MasterMode

    attr_reader :given_code, :computer_guess, :compare_array

    include GameRules
    include Display
    def initialize
        @compare_array = create_array
        @computer_guess = []
        puts "MASTER MODE SELECTED"
    end

    def computer_loop
        "Insert the code(q to exit): "
        @given_code= get_input.split(//)
        turn=1
        if given_code !='q'
            print_code(given_code)
            while turn<=12 do
                get_guess(turn)
                puts "Computer guess num #{turn}"
                print_code(computer_guess)
                puts "\n"
                if won?(given_code,@computer_guess)
                    p "The computer WON!!!"
                    break
                end
                turn+=1
            end
        end
    end

    def get_input
        input = gets.chomp
        if /^[1-6]{4}$/.match(input)
            return input
        elsif input.downcase=='q'
            return 'q'
        else
            puts "Insert a valid option!!!"
            get_input
        end
    end

    def get_guess(turn)

        if turn ==1
            @computer_guess = ['1','1','2','2']

        else
            compare(given_code,computer_guess)
            base_pins = [exact_qnty,dif_pos]
            reduce_guesses(base_pins)
            @computer_guess = minimax.map(&:to_s)
        end
    end

    def reduce_guesses(pins)
        index = 0 
        while index < compare_array.length do
            compare(computer_guess,compare_array[index].map(&:to_s))
            comp_pins = [exact_qnty,dif_pos]
            unless comp_pins == pins
                compare_array.delete_at(index)
            else
                index+=1  
            end
        end 
    end

    def minimax
        maximum_hash=get_maximum
        minimum_hash=get_minimum(maximum_hash)
        return minimum_hash[0]
    end

    def get_maximum
        guess_maxes = Hash.new
        compare_array.each_with_index do |guess, i|
            max_collection = Hash.new
            compare_array.each_with_index do |code, j|
                compare(code,guess)
                if max_collection[[exact_qnty,dif_pos]] !=nil
                    max_collection[[exact_qnty,dif_pos]]+=1
                else
                    max_collection[[exact_qnty,dif_pos]]= 1
                end
                
            end
            guess_maxes[guess]=max_collection.max{|a,b| a[1]<=>b[1]}[1]
        end
        return guess_maxes

    end
    
    def get_minimum(maxes_hash)
        return maxes_hash.min {|a,b| a[1]<=>b[1]}
    end

    def create_array
        vec=[1,2,3,4,5,6]
        return vec.repeated_permutation(4).to_a
    end
end

