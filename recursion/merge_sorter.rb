def merge_sorter(array)
    if array.length<2
        return array
    end

    left = merge_sorter(array.take(array.length/2))
    right = merge_sorter(array.drop(array.length/2))

    newarr=[]
    until left.empty? || right.empty? do
        if left[0]<right[0]
            newarr.push(left.shift())
        else
            newarr.push(right.shift())
        end
    end
    return newarr+left+right
end


p merge_sorter([4,3,5,1,8,12,17,9,0,15,17])