f = open("day3/input.txt", "r")
data = readlines(f)
sum = 0
grid = 140

#Add padding to avoid out of bound and if checks
padding = repeat(".", grid)
data = vcat(padding,data)
push!(data, padding)

for i in eachindex(data)
    data[i] = "." * data[i] * "."
end

# check symbols surrounding numbers
function check_for_symbols(i, j)
    for k in [-1, 0, 1]
        for l in [-1, 0, 1]
            if (string(data[i+k][j+l]) != ".") && (!isnumeric(data[i+k][j+l]))
                return true
            end
        end
    end
    return false
end

for i in 2:grid+1
    numberbuilder = ""
    valid_number = false

    for j in 2:grid+1
        if isnumeric(data[i][j]) 
            numberbuilder = numberbuilder * data[i][j]

            if(check_for_symbols(i,j)) 
                valid_number = true
            end
        else
            if valid_number
                global sum = sum + parse(Int, numberbuilder)
            end
            numberbuilder = ""
            valid_number = false
        end
    end
    #Check if you have a number when end of line. #only 1 hour wasted on this edge case..
    if valid_number
        global sum = sum + parse(Int, numberbuilder)
    end
end

print(sum)
    
