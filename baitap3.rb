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