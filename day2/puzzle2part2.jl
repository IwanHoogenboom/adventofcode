# 12 red cubes, 13 green cubes, and 14 blue cubes
f = open("day2/input.txt", "r")
data = readlines(f)
sum = 0

function power_game(string)
    max_color = Dict(
        "red" => 0,
        "green" => 0,
        "blue" => 0
    )
    grabs_array = split(string, ";")

    for grab in grabs_array
        balls = split(grab, ',')
        for i in balls
            num = parse(Int64, filter(isdigit, i))
            if (num > max_color[filter(isletter, i)])
                max_color[filter(isletter, i)] = num
            end
        end
    end
    return max_color["red"] * max_color["green"] * max_color["blue"]
end

for ID in eachindex(data)
    _, grabs = split(data[ID], ":")
    global sum = sum + power_game(grabs)
end

println(sum)