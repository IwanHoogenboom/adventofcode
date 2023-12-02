f = open("day1/input.txt", "r")
data = readlines(f)

sum = 0
for line in data
    line = replace(line, "one" => "1e", "two" => "2o", "three" => "3e", "four" => "4r", "five" => "5e", "six" => "6x", "seven" => "7n", "eight" => "8t", "nine" => "9e") 
    line = replace(line, "one" => "1e", "two" => "2o", "three" => "3e", "four" => "4r", "five" => "5e", "six" => "6x", "seven" => "7n", "eight" => "8t", "nine" => "9e") 
    digits = filter(isdigit, line)
    number = first(digits) * last(digits)
    global sum = sum + parse(Int, number)
end

print(sum)