require_relative 'filehandler.rb'
require_relative 'messages.rb'

class Game
    include FileHandler
    include Messages
    attr_reader :word,:wrong_guesses, :guesses
    def initialize
        @guesses=[]
        @wrong_guesses = []
    end

    def play
        selectmode_mes
        mode = get_input(/^[1-2]$/)
        if mode == '1'
            new_game
        else
            name_mes
            name=get_input(/[a-z]/)
            load(name)
            guess_time
        end
    end

    def new_game
        @word = get_word.split(//)
        word.each{@guesses.push('_')}
        guess_time
    end

    def guess_time
        while wrong_guesses.length < 8 do
            inputguess_mes
            guess = get_input(/^[a-z]$|^save$/i)
            if guess.match(/^[a-z]$/)
                comparer(guess)
            elsif guess.match(/^save$/)
                name_mes
                save(get_input(/[a-z]/))
            end
            puts @word
            word_mes(@guesses)
            puts "\n"
            wrongword_mes(wrong_guesses)
            if gamewon?
                break
            end
        end

        if wrong_guesses.length<8
            youwon_mes
        else
            youlost_mes(@word)
        end
        
    end

    def comparer(guess)
        if word.include?(guess)
            answer_update(guess)   
        else
            unless wrong_guesses.include?(guess)
                wrong_guesses.push(guess)
            end
        end
    end

    def answer_update(guess)
        word.each_with_index  do |char,index|
            if char.match(guess)
                @guesses[index]=guess
            end
        end
    end

    def get_input(regex)
        input = gets.chomp

        if input.match(regex)
            return input

        else
            get_input(regex)
        end
    end

    def gamewon?
        return @guesses==word
    end
end
