f = open("day1/input.txt", "r")
data = readlines(f)

sum = 0
for line in data
    digits = filter(isdigit, line)
    number = first(digits) * last(digits)
    global sum = sum + parse(Int, number)
end

print(sum)