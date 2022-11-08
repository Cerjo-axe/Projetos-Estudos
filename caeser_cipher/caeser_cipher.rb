def converter(message, shift)
    result=""
    message.each_char do |c|
        if c.ord.between?(65,90) || c.ord.between?(97,122)
            #Verifies if char is Upper or Lowercase
            kind = c.ord>96 ? 97:65
            shifter=(((c.ord-kind)+shift)%26)+kind
            result+=shifter.chr
        else
            result+=c
        end
    end
    result
end


puts converter("8932950Zocoro", 6)