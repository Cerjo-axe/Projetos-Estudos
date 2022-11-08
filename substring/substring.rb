def substrings (sentence, dictionary)
    counter = Hash.new(0)
    dictionary.each do |word|
        sentence.downcase.split.each do |target|
             if target.include?(word)
                counter[word]+=1
            end
        end
    end 
    counter
end


dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

puts substrings("Howdy partner, sit down! How's it going?", dictionary)