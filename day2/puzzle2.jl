# 12 red cubes, 13 green cubes, and 14 blue cubes

max_color = Dict(
    "red" => 12,
    "green" => 13,
    "blue" => 14
)

f = open("day2/input.txt", "r")
data = readlines(f)
sum = 0

function check_grab(string)
    balls = split(string, ',')
    for i in balls
        num = parse(Int64, filter(isdigit, i))
        if (num > max_color[filter(isletter, i)])
            return false  
        end  
    end
    return true
end

for ID in eachindex(data)
    _, grabs = split(data[ID], ":")
    grabs_array = split(grabs, ";")

    possible = true
    for grab in grabs_array
        if(!check_grab(grab))
            possible = false
            break;
        end
    end
    if possible
        global sum = sum + ID
    end
end

println(sum)