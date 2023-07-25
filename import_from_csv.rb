require 'pg'
require 'csv'

pg = PG.connect(dbname: 'postgres', user: 'postgres', password: 'password', host: 'db')

rows = CSV.read("./data.csv", col_sep: ';')

columns = rows.shift.map { |column_name| column_name.gsub(/[\s\/]/, '_') }

rows.each do |row|
  data = columns.zip(row).to_h
  data = data.transform_values { |v| v.to_s.gsub("'", "''") }
  sql = "INSERT INTO exams (\"#{data.keys.join('", "')}\") VALUES (#{data.values.map { |v| "'#{v}'" }.join(', ')})"
  pg.exec(sql)
end
