def bubblesorter (array)
    unfinished = true
    while unfinished do
        unfinished=false
        for i in 0...(array.length-1)
            if array[i]>array[i+1]
                placeholder=array[i]
                array[i]=array[i+1]
                array[i+1]=placeholder
                unfinished= true
            end
        end
    end
    p array
end

bubblesorter([4,3,78,2,0,2])