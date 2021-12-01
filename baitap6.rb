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

# Code e ngắn gọn, giải thuật ok
# Khi e sử dụng include? để check có phần tử nào khác trong mảng có giá trị cần tìm kg thì cũng như là e dùng dòng for thứ 2 rồi ah e, 
# nhưng cũng ok, nhưng vd sau này mảng có hàng triệu phần tử mà e sử dụng include? như vậy sẽ chạy hơi lâu nhé
