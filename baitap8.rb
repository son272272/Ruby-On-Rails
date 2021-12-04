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

# Code e viết rất gọn. Tuy nhiên, e sử dụng include? thì cũng giống như sử dụng vòng for thứ 2 ah e, vì bản chất, include? cũng sẽ duyệt qua từng
# phần tử trong mảng để check ah
