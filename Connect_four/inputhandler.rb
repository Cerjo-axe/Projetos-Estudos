class InputHandler
    
    def self.getinput(regex)
        input = gets.chomp

        return input if input.match(regex)
        
        getinput(regex)
    end

    def self.inputconverter(input)
        input = input - 1
        input
    end
end