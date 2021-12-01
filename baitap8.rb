def check_sub_arrays (array_one,array_two)
    checks = []
    for num in array_one
        checks << num if array_two.include?(num)
    end
    checks == array_two
end
array_one= [-2,3,6,8,1,14,7,5]
array_two= [-2,1,7,5]
puts " #{check_sub_arrays(array_one,array_two)}\n"