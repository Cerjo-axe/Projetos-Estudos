class Display
    def self.displayboard(board)
        for i in 0...6 do
            print "||"
            for j in 0...7 do
               print board[i][j]
               print "|" unless j==6 
            end
            puts "||"
        end
    end
end