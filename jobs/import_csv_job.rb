require 'sidekiq'
require 'pg'
require 'csv'

class ImportCsvJob
  include Sidekiq::Worker

  def perform(csv_content)
    pg = PG.connect(dbname: 'postgres', user: 'postgres', password: 'password', host: 'db')

    csv = CSV.parse(csv_content, col_sep: ';')

    columns = csv.shift.map { |column_name| column_name.gsub(/[\s\/]/, '_') }

    csv.each do |row|
      data = columns.zip(row).to_h
      data = data.transform_values { |v| v.to_s.gsub("'", "''") }
      sql = "INSERT INTO exams (\"#{data.keys.join('", "')}\") VALUES (#{data.values.map { |v| "'#{v}'" }.join(', ')})"
      pg.exec(sql)
    end
  end
end
