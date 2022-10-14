class Board
    attr_reader :houses
    def initialize
        @houses = [1,2,3,4,5,6,7,8,9]
    end

    def showBoard
        puts <<-HEREDOC
            #{houses[0]} | #{houses[1]} | #{houses[2]}
            --.---.--
            #{houses[3]} | #{houses[4]} | #{houses[5]}
            --.---.--
            #{houses[6]} | #{houses[7]} | #{houses[8]}
        HEREDOC
    end

    def updateBoard(input,symbol)
       @houses[input]=symbol 
    end

    def is_valid?(input)
        houses[input-1]==input
    end

    def iscomplete?
        !houses.all? {|house| house.is_a?(String)}
    end
end
