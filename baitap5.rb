def check(so)
    begin
        x = Integer(so)
        true if x > 0 && x <=99
    rescue
        false
    end
end
puts "Nhap so luong phan tu cua mang : "
number = gets 
until check(number)
    puts "Nhap khong hop le,nhap lai : "
    number = gets
end

n = number.to_i

arrays = Array.new(n) { |i| i = rand(1..9)}

print "mang random la : #{arrays}\n"

left = 0
level = 1
n = n - 1

for i in 0..n
    if i==n
      print "mang con tang #{level} : #{arrays[left..i]}\n"
    else    
      if arrays[i] > arrays[i+1]
         print "mang con tang #{level} : #{arrays[left..i]}\n"
         left = i+1
         level = level + 1
      end
    end
end

# Code của e gọn, dễ đọc, bắt được những exception của user input
# A có vài góp ý nhỏ:
# 1. Tên biến e cần đặt có ý nghĩa hơn. Vd: n
# 2. Giữ phép toán so sánh, e nên cách ra cho dễ đọc. VD: if i==n -> if i == n
# 3. Em có thể xem xét tách thêm hàm check input của user nhập vào có hợp lệ hay kg ra 1 hàm để 
