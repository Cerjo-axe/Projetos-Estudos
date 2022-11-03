require 'json'

module FileHandler
    def get_word
        list = IO.readlines('dictionary.txt')
        list = list.each(&:strip!).select { |word| word.length.between?(5, 12) }
        list[rand(0..list.length)]
    end

    def save(name)
        Dir.mkdir 'saves' unless Dir.exist? 'saves'
        @filename = "#{name}.json"
        File.open("saves/#{@filename}","w") {|file| file.write convert_JSON}
    end

    def load(name)
        file = JSON.load(File.read("saves/#{name}.json"))
        @word=file['word']
        @guesses=file['guesses']
        @wrong_guesses=file['wrong_guesses']
        File.delete("saves/#{name}.json") if File.exist?("saves/#{name}.json")
    end

    def convert_JSON
        JSON.dump({
            :word => @word,
            :guesses => @guesses,
            :wrong_guesses => @wrong_guesses
        })
    end
end
