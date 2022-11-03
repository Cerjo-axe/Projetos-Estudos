
def fibs(n)
    array=[]
    n.times do |c|
        if c == 0 
            array.push(0)
        elsif c==1
            array.push(1)
        else
            array.push(array[c-1]+array[c-2])
        end
    end
    array
end

def fibs_rec(n)
    array=[]
    if n==0
        return 0
    end
    if n==1
        return 1
    end
    fibs_rec(n-1)+fibs_rec(n-2)
end


p fibs(5)
p fibs_rec(5)