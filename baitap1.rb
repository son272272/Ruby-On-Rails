myArray = [] # biến trong ruby thì e nên đặt là my_array nhé. biến chứa nhiều phần tử nên là số nhiều

puts "Ban hay nhap gia tri cac phan tu cua mang! (Nhap -1 de ket thuc )"
while myArray.length <= 99
    print "Nhap gia tri :  "
    user_input = gets.chomp
    loop do
            unless user_input == user_input+"String" || user_input.to_i > 0 || user_input == "-1" 
                print "Sai Dinh dang. Moi ban nhap lai: "
                user_input = gets.chomp
            else
            break # nên thêm 1 tab thụt vào
            end
        end

    user_input = user_input.to_i
    if user_input == -1 # -1 e có thể khai báo là hằng số để dễ đọc, vd: STOP_SIGNAL = -1
    break # nên thêm 1 tab thụt vào
    else
        myArray << user_input
    end
end

puts "Mang cua ban la: myArray = #{myArray}"

min = myArray[0]
myArray.each do |item|
min = item if item < min # nên thêm 1 tab thụt vào để dễ đọc
end
puts  "Gia Tri nho nhat la: #{min}"

# Chương trình e viết gọn gàng, chú ý cách đặt tên biến nhé
# Vẫn có bug khi user input không đúng
# Vd: 
# Ban hay nhap gia tri cac phan tu cua mang! (Nhap -1 de ket thuc )
# Nhap gia tri :  9abcabc
# Nhap gia tri :  3+1
# Nhap gia tri :  -1
# Mang cua ban la: myArray = [9, 3]
# Gia Tri nho nhat la: 3
