
module Display

    def color_code(number)
        color_codes={
            '1' => "\e[101m  1  \e[0m ",
            '2' => "\e[43m  2  \e[0m ",
             '3' => "\e[44m  3  \e[0m ",
             '4' => "\e[45m  4  \e[0m ",
            '5' => "\e[46m  5  \e[0m ",
             '6' => "\e[41m  6  \e[0m "
        }
        return color_codes[number]
    end

    def print_code(code)
        code.each do |color|
            print color_code(color)
        end
        puts "\n"
    end

    def print_pins(e_qnty,w_qnty)
        e_qnty.times {print "\e[91m X \e[0m "}
        w_qnty.times {print "\e[37m O \e[0m "}
        puts "\n"
    end
end