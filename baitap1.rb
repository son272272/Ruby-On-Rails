myArray = []

puts "Ban hay nhap gia tri cac phan tu cua mang! (Nhap -1 de ket thuc )"
while myArray.length <= 99
    print "Nhap gia tri :  "
    user_input = gets.chomp
    loop do
            unless user_input == user_input+"String" || user_input.to_i > 0 || user_input == "-1" 
                print "Sai Dinh dang. Moi ban nhap lai: "
                user_input = gets.chomp
            else
            break
            end
        end

    user_input = user_input.to_i
    if user_input == -1
    break
    else
        myArray << user_input
    end
end

puts "Mang cua ban la: myArray = #{myArray}"

min = myArray[0]
myArray.each do |item|
min = item if item < min
end
puts  "Gia Tri nho nhat la: #{min}"