require 'csv'
require 'pg'


begin_create_file = Time.now
  base_record = {
    name: "TranTrungSon",
    email: "sontt@gmail.com",
    phone: "0775643572",
    address: "BINH THUAN",
    brith: "2000/07/21",
    profile: "Profileaa"
  }
  CSV.open("db.csv", "w") do |csv|
    for i in 1..500000
      csv << [
        base_record[:name] + " " +i.to_s,
        base_record[:name].downcase.gsub(' ','') + i.to_s + "@gmail.com",
        base_record[:phone],
        base_record[:address],
        base_record[:brith],
        base_record[:profile]
      ]
    end
  end
end_create_file = Time.now


begin_read_file = Time.now
  db = CSV.read("db.csv")
  db.each { |record| p record }
end_read_file = Time.now



begin_import_file = Time.now
  con = PG.connect(dbname: 'baitap3', user:'son123')
  x = row[5].gsub("'","''")
   for row in db
    con.exec("INSERT INTO Info(name, email, phone, address, brith, profile) 
              VALUES('#{row[0]}','#{row[1]}','#{row[2]}','#{row[3]}','#{row[4]}','#{x}')")
    end
end_import_file = Time.now


puts "Creating file: #{end_create_file - begin_create_file}s"
puts "Reading file: #{end_read_file - begin_read_file}s"
puts "Importing file: #{end_import_file - begin_import_file}s"
puts "Reading & Importing file: #{end_import_file - begin_read_file}s"

# Phần code e trình bày gọn, dễ đọc 
# db.exec, phần này a thấy e đang insert từng dòng vào trong db, tức là với 500k lines thì mình insert 500k lần về performance có thể bị ảnh hưởng
# do e hit vào db nhiều quá
# A suggest e là
#   1. sử dụng transaction -> e có thể tìm hiểu nó là gì
#   2. build ra 1 câu sql, nhưng khi nào đủ khoảng 5k lines (do e quyết định), rồi hẵn insert vào db. Như vậy sẽ giảm số lần e tương tác db ah
#

# Em trình bày trong 1 file vẫn ok, nhưng khi vào thực tế: e nên tách file ra để dễ quản lý. Vd: file về kết nối db, file để ghi ra file csv,
# file để import từ csv vào db -> mục đích là e sẽ dễ dàng quản lý và xử lý khi sau này có issues. Vd: không connect được db, thì e chỉ cần vào
# file quản lý cấu hình thôi, chứ kg cần scan hết trong 1 file tổng lớn

# Em đang sử dụng csv.read để đọc toàn bộ nội dung lên trên RAM rồi mình xử lý, với những data nhỏ thì kg sao, nhưng bới lượng data lớn thì đây
# là vấn đề, hệ thống có thể không đủ RAM để đọc. Nên a suggest e sử dụng foreach. Em có thể tham khảo 
# https://dalibornasevic.com/posts/68-processing-large-csv-files-with-ruby

# Anh chưa thấy e có xử lý những ký tự đặc biết phần profile ah
# 4 puts phần cuối a đang thấy format gần giống nhau: 2 time trừ nhau, e có thể viết hàm để phần ngày không phải lặp code
