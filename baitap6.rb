numbers = [-1,2,8,9,5,-6]
target_sum = 14
array_two = Array.new
for number in numbers
    test = target_sum - number
    if numbers.include?(test) && test != number
        array_two.push(number,test)
        break
      end
end
p "mang hai so co tong bang #{target_sum} : #{array_two}"