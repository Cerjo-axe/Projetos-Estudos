
module Messages

    def green;          "\e[32m#{self}\e[0m" end
    def red;            "\e[31m#{self}\e[0m" end
    def cyan;           "\e[36m#{self}\e[0m" end
    
    def selectmode_mes
        puts "Select the game mode (1 to start a new game, 2 to load another):"   
    end
    def inputguess_mes
        puts "Input a guess character present in the word(or 'save' to save the game):"
    end

    def word_mes(word)
        puts "GUESS THE WORD:"
        word.each do |char|
            if char.match(/^[a-z]$/)
                print "\e[32m#{char}\e[0m"
            else
                print "\e[36m#{char}\e[0m"
            end
        end
        puts "\n"
    end

    def wrongword_mes(word)
        print "Wrong guesses: "
        word.each do |char|
            print "\e[31m#{char}\e[0m " 
        end
        puts
        puts "Wrong guesses remaining: " + (8-word.length).to_s
    end

    def youwon_mes
        puts "YOU'VE WON"
        puts "CONGRATULATIONS!!!"
    end

    def youlost_mes(word)
        puts "YOU LOST!!!"
        puts "Correct answer: " + word.to_s
    end

    def name_mes
        puts "Input the filename:"
    end
end