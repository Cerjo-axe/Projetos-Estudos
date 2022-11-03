require_relative 'node.rb'

class Linked_Lists
    attr_accessor :head, :tail

    def initialize
        @head = nil
        @tail = nil
    end

    def append(value)
        new_node = Node.new(value)
        if @head.nil?
            @head = new_node
            @tail = new_node
        else
            @tail.next_node = new_node
        end
    end
    def prepend(value)
        unless @head.nil?
            new_node = Node.new(value, @head)
            @head = new_node
        else
            @head = Node.new(value)
            @tail = @head
        end
    end
    def size
        counter=0
        return counter if head.nil?
        node = @head
        counter +=1
        until node.next_node.nil? do
            counter+=1
            node= node.next_node
        end
        return counter
    end

    def at(index)
        unless index>=size
            position=0
            node = @head
            while position<index do
                node=node.next_node
                position+=1
            end
            return node

        else
            puts "Invalid index"
        end
    end

    def pop
        node = @head
        while true do
            if node.next_node == @tail 
                @tail = node
                node.next_node = nil
                break
            elsif node == @tail
                @head = nil
                @tail = nil
                break
            else
                node = node.next_node
            end
        end
    end

    def contains?(val)
        node = @head
        until node.nil?
            if node.value == val
                return true
            end
            node = node.next_node
        end
        return false
    end

    def find(val)
        index = 0
        node = @head
        until node.nil?
            if node.value == val
                return index
            end
            node = node.next_node
            index+=1
        end
        return nil
    end

    def to_s
        string =""
        node = @head
        until node.nil?
            string+= "(#{node.value}) -> "
            node = node.next_node
        end
        string += "nil"
        return string
    end

    def insert_at(val,index)
        if index==0
            prepend(val)
        elsif index==size
            append(val)
        elsif index > size || index< 0
            puts "Invalid index"
        else
            current_node = at(index)
            previous_node = at(index-1)
            previous_node.next_node = Node.new(val,current_node)
        end
    end

    def remove_at(index)
        if index==0
            @head = at(1)
        elsif index == size
            @tail = at(index-1)
            @tail.next_node= nil
        else
            previous_node = at(index-1)
            previous_node.next_node = at(index+1)
        end
    end
end

list = Linked_Lists.new
list.prepend(30)
list.prepend(nil)
list.prepend(20)
list.prepend(100)
p list.to_s
list.insert_at(50,2)
p list.to_s
list.remove_at(2)
p list.to_s
