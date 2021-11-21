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