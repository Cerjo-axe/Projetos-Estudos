class Knight
    
    MOVES = [[1,2],[2,1],[2,-1],[1,-2],[-1,-2],[-2,-1],[-2,1],[-1,2]].freeze
    attr_reader :position, :moves
    attr_accessor :children
    def initialize(position)
        @position = position
        @moves = define_moves
        @children =[]
    end

    def define_moves
        result = []
        MOVES.each do |move|
            x = position[0] + move[0]
            y = position[1] + move[1]
            if x.between?(0,7) && y.between?(0,7)
                result.push([x,y])
            end
        end
        return result
    end
end