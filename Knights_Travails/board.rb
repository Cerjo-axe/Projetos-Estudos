require_relative 'knight.rb'

class Board
    attr_reader :root

    def populate_children(cur_node)
        cur_node.moves.each do |move|
            child = Knight.new(move)
            cur_node.children.push(child)
        end
    end

    #verify if chil is already in the tree, or if its equal to destination
    def child_presence(coordinate, queue = [root])
        node = queue.shift
        knight = nil

        if node.nil?
            return nil
        end
        node.children.each do |child|
            unless queue.length>60
                queue.push(child) unless queue.include?(child)
            end
            if child.position == coordinate
                knight = child
            end
        end
        unless knight.nil?
            return knight
        end

        child_presence(coordinate,queue)
    end
    
    def movement_tree(finish , queue = [root])
        node = queue.shift
        populate_children(node)
        node.children.each do |child|
            queue.push(child) unless queue.include?(child)
        end

        return true if node.position == finish

        movement_tree(finish,queue)
    end

    def find_path(finish,path=[])
        path.unshift(finish)
        parent = find_parent(finish)
        if finish == root.position
            return path
        end
        find_path(parent.position,path)
    end

    def find_parent(pos, queue=[root])
        node = queue.shift
        return node if node.children.any? {|child| child.position==pos}

        node.children.each do |child|
            queue.push(child) unless queue.include?(child)
        end
        find_parent(pos,queue)
    end

    def knight_moves(start , finish)
        @root = Knight.new(start)
        movement_tree(finish)
        path = find_path(finish)
        path.each {|move| print move}
    end
end

board = Board.new

board.knight_moves([1,2],[4,7])