def stocks(values)
    low_p= values[0]
    low_i=0
    profit=0
    days=[0,0]
    values.each_with_index do |price,index|
        if price<low_p
            low_p=price
            low_i=index
        end
        if profit<(price-low_p)
            profit=price-low_p
            days=[low_i,index]
        end
    end
    days
end

array = [17, 3, 6, 9, 15, 8, 5, 1, 10]

p stocks(array)