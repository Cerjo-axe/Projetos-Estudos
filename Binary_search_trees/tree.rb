require_relative 'node.rb'

class Tree
    attr_reader :root
    def initialize(arr)
        @data = arr.sort.uniq
        @root = build_tree(@data)
    end

    def build_tree(array)
        return nil if array.empty?

        middle = (array.length-1)/2 

        root_temp = Node.new(array[middle])

        root_temp.left= build_tree(array[0...middle])
        root_temp.right=build_tree(array[middle+1..-1])

        return root_temp
    end

    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
    end
    
    def insert(value, node = root)
        if value == node.data
            return nil
        end
        if value<node.data
            node.left.nil? ? node.left= Node.new(value) : insert(value,node.left)
        else
            node.right.nil? ? node.right= Node.new(value) : insert(value,node.right)
        end
    end

    def delete(value, node =root)
        return node if node.nil?

        if value<node.data
            node.left = delete(value, node.left)
        elsif value>node.data
            node.right = delete(value,node.right)
        else
            if node.left.nil?
                return node.right
            elsif node.right.nil?
                return node.left
            end

            successor = min_value(node.right)
            node.data = successor.data
            node.right= delete(successor.data,node.right)
        end
        node
    end

    def find(value, node=root)
        return node if node.nil?

        if value<node.data
            find(value,node.left)
        elsif value>node.data
            find(value,node.right)
        else
            node
        end
    end

    def level_order
        queue=[root]
        result=[]
        until queue.empty? do
            node=queue.shift
            if block_given?
                yield(node)
            else
                result.push(node.data)
            end
            queue.push(node.left) unless node.left.nil?
            queue.push(node.right) unless node.right.nil?
        end
        return result unless block_given?
    end

    def preorder (node=root,result = [], &block)  
        unless node.nil?
            block.call(node) if block
            result.push(node.data) unless block
            preorder(node.left,result,&block)
            preorder(node.right,result,&block)
            result
        end
    end

    def inorder (node=root,result = [], &block)  
        unless node.nil?
            inorder(node.left,result,&block)
            block.call(node) if block
            result.push(node.data) unless block
            inorder(node.right,result,&block)
            result
        end
    end

    def postorder (node=root,result = [], &block)  
        unless node.nil?
            postorder(node.left,result,&block)
            postorder(node.right,result,&block)
            block.call(node) if block
            result.push(node.data) unless block
            result
        end
    end

    def height (node,count=-1)
        return count if node.nil?
        count+=1
        return [height(node.left,count),height(node.right,count)].max
    end

    def depth(node)
        current_node=root
        count=0
        until current_node==node
            count+=1
            current_node = current_node.left if node.data<current_node.data
            current_node = current_node.right if node.data>current_node.data
        end
    end

    def balanced?(node=root)
        left_h = height(node.left)
        right_h=height(node.right)
        p (left_h-right_h).abs
        return true if (left_h-right_h).abs <= 1 && node.right.nil? ? balanced?(node.right) : false && node.left.nil? ? balanced?(node.left) : false
        false
    end

    def rebalance
        @root = build_tree(inorder)
    end

    def min_value(node)
        node = node.left until node.left.nil?
        return node
    end
end

tree = Tree.new(Array.new(15) { rand(1..100) })
tree.pretty_print
p tree.balanced?
p tree.inorder
p tree.postorder
p tree.postorder