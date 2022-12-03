
class Board
    attr_reader :board
    def initialize
        @board = Array.new(6){Array.new(7,0)}
        p board
    end

    def columnfilled?(column)
        column_vec=[]
        for i in 0...6 do
            column_vec.push(board[i][column])
        end
        return column_vec.none?(0)
    end
    def placepiece(player, column)
        i = 5

        while i>=0
            if board[i][column] == 0
                board[i][column]=player
                p board
                break
            end 
            i-=1
        end
    end

    def haswon?
        #vertical checker
        comp_vec = Array.new(4)
        for j in 0...7 do
            for i in 0..2 do
               comp_vec[0]=board[i][j] 
               comp_vec[1]=board[i+1][j] 
               comp_vec[2]=board[i+2][j] 
               comp_vec[3]=board[i+3][j]
               return true if comp_vec.uniq.length == 1 && comp_vec.uniq[0] !=0 
            end
        end
        #horizontal checker
        comp_vec = Array.new(4)
        for i in 0...6 do
            for j in 0..3 do
               comp_vec[0]=board[i][j] 
               comp_vec[1]=board[i][j+1] 
               comp_vec[2]=board[i][j+2] 
               comp_vec[3]=board[i][j+3] 
               return true if comp_vec.uniq.length == 1 && comp_vec.uniq[0] !=0
            end
        end
        #diagonal1 checker
        comp_vec = Array.new(4)
        for i in 0..2 do
            for j in 0..3 do
               comp_vec[0]=board[i][j] 
               comp_vec[1]=board[i+1][j+1] 
               comp_vec[2]=board[i+2][j+2] 
               comp_vec[3]=board[i+3][j+3] 
               return true if comp_vec.uniq.length == 1 && comp_vec.uniq[0] !=0
            end
        end
        #diagonal1 checker
        comp_vec = Array.new(4)
        for i in 0..2 do
            for j in 0..3 do
               comp_vec[0]=board[i+3][j] 
               comp_vec[1]=board[i+2][j+1] 
               comp_vec[2]=board[i+1][j+2] 
               comp_vec[3]=board[i][j+3] 
               return true if comp_vec.uniq.length == 1 && comp_vec.uniq[0] !=0
            end
        end
        return false
    end

    def isfull?
        return true if board.none?(0)

        return false
    end
end