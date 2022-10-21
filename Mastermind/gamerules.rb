

module GameRules

    attr_reader :exact_qnty, :dif_pos
    def won? (master_code, guess_code)
        return master_code==guess_code
    end

    def compare(master_code,guess_code)
        @temp_master = master_code.clone
        @temp_guess = guess_code.clone
        @exact_qnty = exact_matches(@temp_master,@temp_guess)
        @dif_pos = wrong_position(@temp_master,@temp_guess)
    end

    def exact_matches(master_code, guess_code)
        exact=0
        guess_code.each_with_index do |code, index| 
            if code==@temp_master[index]
                exact+=1
                @temp_guess[index]='O'
                @temp_master[index]='O'
            end
        end
        exact
    end

    def wrong_position(master_code, guess_code)
        w_pos=0
        for index in 0 .. guess_code.length do
            if guess_code[index] != 'O' && master_code.include?(guess_code[index])
                w_pos+=1
                pos = master_code.find_index(guess_code[index])
                @temp_master[pos]='X'
                @temp_guess[index]='X'
            end
        end
        w_pos
    end
end